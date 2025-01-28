import 'package:dio/dio.dart';
import 'package:preferences/preferences.dart';

class LanguageInterceptor extends Interceptor {
  LanguageInterceptor({
    required this.preferencesDataSource,
  });

  final PreferencesDataSource preferencesDataSource;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var languageCode = await preferencesDataSource.languageCodeOrDefault;
    if (languageCode == 'my') {
      languageCode = 'mm'; // Change 'my' to 'mm' for the API
    }
    options.headers['Accept-Language'] = languageCode;
    handler.next(options);
  }
}
