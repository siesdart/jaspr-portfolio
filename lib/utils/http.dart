import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:portfolio/utils/dotenv.dart';

final dio = Dio(BaseOptions(
  headers: {
    if (env.isDefined('GITHUB_TOKEN'))
      'Authorization': 'Bearer ${env['GITHUB_TOKEN']}',
  },
))
  ..interceptors.add(DioCacheInterceptor(
    options: CacheOptions(
      store: FileCacheStore('.cache'),
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 1),
    ),
  ));
