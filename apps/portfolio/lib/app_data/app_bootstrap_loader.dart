import 'package:core/core.dart';
import 'package:portfolio/app_data/app_data.dart';
import 'package:portfolio/app_data/app_data_loader.dart';

class AppBootstrapLoader implements AppDataLoader<AppData> {
  const AppBootstrapLoader({
    required this.configLoader,
    required this.contentLoader,
  });

  final AppDataLoader<Config> configLoader;
  final AppDataLoader<Content> contentLoader;

  @override
  Future<AppData> load() async {
    final loaded = await Future.wait([
      configLoader.load(),
      contentLoader.load(),
    ]);

    return AppData(
      config: loaded[0] as Config,
      content: loaded[1] as Content,
    );
  }
}
