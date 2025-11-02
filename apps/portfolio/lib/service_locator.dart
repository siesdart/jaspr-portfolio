import 'dart:async';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:github/github.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  if (!getIt.isRegistered<DotEnv>()) {
    getIt.registerSingletonAsync<DotEnv>(() async => DotEnv()..load());
    unawaited(
      getIt.isReady<DotEnv>().then((_) => stdout.writeln('DotEnv is loaded.')),
    );
  }
  if (!getIt.isRegistered<GitHub>()) {
    getIt.registerSingletonWithDependencies<GitHub>(
      () {
        final dotEnv = getIt<DotEnv>();
        return GitHub(
          auth: dotEnv.isDefined('GITHUB_TOKEN')
              ? Authentication.bearerToken(dotEnv['GITHUB_TOKEN']!)
              : const Authentication.anonymous(),
        );
      },
      dependsOn: const [DotEnv],
      dispose: (github) => github.dispose(),
    );
    unawaited(
      getIt.isReady<GitHub>().then((_) {
        final auth = getIt<GitHub>().auth;
        if (auth.isAnonymous) {
          stdout.writeln('GitHub is initialized with Anonymous mode.');
        } else {
          stdout.writeln(
            'GitHub is initialized with Bearer token ${auth.bearerToken}.',
          );
        }
      }),
    );
  }
}
