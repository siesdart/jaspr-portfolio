import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:github/github.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  if (!getIt.isRegistered<DotEnv>()) {
    getIt.registerLazySingleton<DotEnv>(
      DotEnv.new,
      onCreated: (dotEnv) {
        dotEnv.load();
        stdout.writeln('DotEnv is initialized.');
      },
    );
  }

  if (!getIt.isRegistered<GitHub>()) {
    getIt.registerLazySingleton<GitHub>(
      () {
        final dotEnv = getIt<DotEnv>();
        return GitHub(
          auth: dotEnv.isDefined('GITHUB_TOKEN')
              ? Authentication.bearerToken(dotEnv['GITHUB_TOKEN']!)
              : const Authentication.anonymous(),
        );
      },
      dispose: (github) => github.dispose(),
      onCreated: (gitHub) {
        if (gitHub.auth.isAnonymous) {
          stdout.writeln('GitHub is initialized anonymously.');
        } else {
          stdout.writeln(
            'GitHub is initialized with token: ${gitHub.auth.bearerToken!.substring(0, 4)}...${gitHub.auth.bearerToken!.substring(gitHub.auth.bearerToken!.length - 4)}',
          );
        }
      },
    );
  }
}
