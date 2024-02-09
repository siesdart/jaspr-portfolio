import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/providers/config.dart';
import 'package:portfolio/utils/codec.dart';
import 'package:portfolio/utils/http.dart';

final projectsProvider = SyncProvider<List<Project>>(
  (ref) async {
    final repos = ref.read(configProvider).value!.project;
    final projects = await Future.wait(repos.map((repo) async {
      final response = await dio.get<Map<String, dynamic>>(
        'https://api.github.com/repos/${repo['repo']}',
      );
      return ProjectMapper.fromMap({...response.data!, 'year': repo['year']});
    }));
    return projects;
  },
  id: 'projects',
  codec: MapperCodec(),
);
