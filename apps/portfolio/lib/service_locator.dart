import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:github/github.dart';

final getIt = GetIt.instance;

void setupLocator() {
  if (!getIt.isRegistered<DotEnv>()) {
    getIt.registerSingletonAsync<DotEnv>(() async => DotEnv()..load());
    getIt.isReady<DotEnv>().then((_) => stdout.writeln('DotEnv is loaded.'));
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
    getIt.isReady<GitHub>().then((_) {
      if (getIt<GitHub>().auth.isAnonymous) {
        stdout.writeln('GitHub is initialized with Anonymous mode.');
      } else {
        stdout.writeln(
          'GitHub is initialized with Bearer token ${getIt<GitHub>().auth.bearerToken}.',
        );
      }
    });
  }
}
