import 'package:core/core.dart';
import 'package:github/github.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/providers/utils.dart';
import 'package:portfolio/service_locator.dart';

final FutureProvider<String> introductionProvider = createFileProvider(
  'introduction.md',
);
final FutureProvider<String> skillProvider = createFileProvider('skill.md');
final FutureProvider<List<Career>> careersProvider = createDirectoryProvider(
  'careers',
  CareerMapper.fromJson,
);
final FutureProvider<List<Project>> projectsProvider = createDirectoryProvider(
  'projects',
  ProjectMapper.fromJson,
);
final FutureProvider<List<Opensource>> opensourcesProvider =
    createDirectoryProvider('opensources', (json) async {
      final opensource = OpensourceMapper.fromJson(json);
      if (opensource.contribution != null) {
        final github = getIt<GitHub>();

        for (var i = 0; i < opensource.contribution!.length; i++) {
          final contribution = opensource.contribution![i];
          if (contribution.title == null) {
            final pr = await github.pullRequests.get(
              RepositorySlug.full(opensource.repo),
              contribution.id,
            );
            opensource.contribution![i] = contribution.copyWith(
              title: pr.title,
            );
          }
        }
      }
      return opensource;
    });
