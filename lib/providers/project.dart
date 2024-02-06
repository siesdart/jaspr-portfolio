import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/utils/codec.dart';
import 'package:portfolio/utils/http.dart';

final projectsProvider = SyncProvider<List<Project>>(
  (ref) async {
    final repos = ref.read(configProvider).value!.project;
    final projects = await Future.wait(repos.map((repo) async {
      final response =
          await dio.get<String>('https://api.github.com/repos/$repo');
      return ProjectMapper.fromJson(response.data!);
    }));
    return projects;
  },
  id: 'projects',
  codec: MapperCodec(),
);
