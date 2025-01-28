// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtp_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _MtpRestClient implements MtpRestClient {
  _MtpRestClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiDataResponse<LoginSuccessResponseRM>> login({
    required String username,
    required String password,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'username': username,
      'password': password,
    };
    final _options =
        _setStreamType<ApiDataResponse<LoginSuccessResponseRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<LoginSuccessResponseRM> _value;
    try {
      _value = ApiDataResponse<LoginSuccessResponseRM>.fromJson(
        _result.data!,
        (json) => LoginSuccessResponseRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ChangePasswordSuccessResponseRM>> changePassword({
    required String currentPassword,
    required String password,
    required String confirmPassword,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    final _options =
        _setStreamType<ApiDataResponse<ChangePasswordSuccessResponseRM>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/auth/change-password',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ChangePasswordSuccessResponseRM> _value;
    try {
      _value = ApiDataResponse<ChangePasswordSuccessResponseRM>.fromJson(
        _result.data!,
        (json) => ChangePasswordSuccessResponseRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<UserRM>> register({
    required String accountType,
    required String userType,
    String? organization,
    String? affiliation,
    String? position,
    int? collegeId,
    String? educationYear,
    required String username,
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    int? phoneCode,
    String? phoneNumber,
    required List<String> otpChannels,
    required String gender,
    File? profileImage,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'account_type',
      accountType,
    ));
    _data.fields.add(MapEntry(
      'user_type_all',
      userType,
    ));
    if (organization != null) {
      _data.fields.add(MapEntry(
        'organization',
        organization,
      ));
    }
    if (affiliation != null) {
      _data.fields.add(MapEntry(
        'affiliation',
        affiliation,
      ));
    }
    if (position != null) {
      _data.fields.add(MapEntry(
        'position',
        position,
      ));
    }
    if (collegeId != null) {
      _data.fields.add(MapEntry(
        'ec_college',
        collegeId.toString(),
      ));
    }
    if (educationYear != null) {
      _data.fields.add(MapEntry(
        'suitable_for_ec_year[]',
        educationYear,
      ));
    }
    _data.fields.add(MapEntry(
      'username',
      username,
    ));
    _data.fields.add(MapEntry(
      'name',
      fullName,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    _data.fields.add(MapEntry(
      'password_confirmation',
      confirmPassword,
    ));
    if (phoneCode != null) {
      _data.fields.add(MapEntry(
        'country_code',
        phoneCode.toString(),
      ));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry(
        'mobile_no',
        phoneNumber,
      ));
    }
    otpChannels.forEach((i) {
      _data.fields.add(MapEntry('notification_channel[]', i));
    });
    _data.fields.add(MapEntry(
      'gender',
      gender,
    ));
    if (profileImage != null) {
      _data.files.add(MapEntry(
        'profile_image',
        MultipartFile.fromFileSync(
          profileImage.path,
          filename: profileImage.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _options = _setStreamType<ApiDataResponse<UserRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/auth/register',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<UserRM> _value;
    try {
      _value = ApiDataResponse<UserRM>.fromJson(
        _result.data!,
        (json) => UserRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<UserRM>> updateUser({
    required String accountType,
    required String userType,
    String? organization,
    String? affiliation,
    String? position,
    int? collegeId,
    String? educationYear,
    required String username,
    required String fullName,
    required String email,
    int? phoneCode,
    String? phoneNumber,
    required List<String> otpChannels,
    required String gender,
    File? profileImage,
    String include = 'college,years',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'account_type',
      accountType,
    ));
    _data.fields.add(MapEntry(
      'user_type_all',
      userType,
    ));
    if (organization != null) {
      _data.fields.add(MapEntry(
        'organization',
        organization,
      ));
    }
    if (affiliation != null) {
      _data.fields.add(MapEntry(
        'affiliation',
        affiliation,
      ));
    }
    if (position != null) {
      _data.fields.add(MapEntry(
        'position',
        position,
      ));
    }
    if (collegeId != null) {
      _data.fields.add(MapEntry(
        'ec_college',
        collegeId.toString(),
      ));
    }
    if (educationYear != null) {
      _data.fields.add(MapEntry(
        'suitable_for_ec_year[]',
        educationYear,
      ));
    }
    _data.fields.add(MapEntry(
      'username',
      username,
    ));
    _data.fields.add(MapEntry(
      'name',
      fullName,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    if (phoneCode != null) {
      _data.fields.add(MapEntry(
        'country_code',
        phoneCode.toString(),
      ));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry(
        'mobile_no',
        phoneNumber,
      ));
    }
    otpChannels.forEach((i) {
      _data.fields.add(MapEntry('notification_channel[]', i));
    });
    _data.fields.add(MapEntry(
      'gender',
      gender,
    ));
    if (profileImage != null) {
      _data.files.add(MapEntry(
        'profile_image',
        MultipartFile.fromFileSync(
          profileImage.path,
          filename: profileImage.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _options = _setStreamType<ApiDataResponse<UserRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/auth/profile',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<UserRM> _value;
    try {
      _value = ApiDataResponse<UserRM>.fromJson(
        _result.data!,
        (json) => UserRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> verifyOtp({
    required String otpCode,
    required String credential,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'otp_code': otpCode,
      'credential': credential,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/auth/verify-otp',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> requestPasswordResetToken(
      {required String credential}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'credential': credential};
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/auth/password-reset/token',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> verifyPasswordResetToken({
    required String credential,
    required String token,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'credential': credential,
      'token': token,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/auth/password-reset/verify',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> resetPassword({
    required String credential,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'credential': credential,
      'token': token,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/auth/password-reset/reset',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> resendOtp(
      {required String credential}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'credential': credential};
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/auth/resend-otp',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> deactivate() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/deactivate',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<UserRM>> getMe(
      {String include = 'college,years'}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<UserRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/auth/me',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<UserRM> _value;
    try {
      _value = ApiDataResponse<UserRM>.fromJson(
        _result.data!,
        (json) => UserRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CollegeRM>>> getColleges() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<CollegeRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/colleges',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CollegeRM>> _value;
    try {
      _value = ApiDataResponse<List<CollegeRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CollegeRM>(
                    (i) => CollegeRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<EducationYearRM>>> getEducationYears() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<EducationYearRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/years',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<EducationYearRM>> _value;
    try {
      _value = ApiDataResponse<List<EducationYearRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<EducationYearRM>(
                    (i) => EducationYearRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<SubscriptionTermRM>> getSubscriptionTerm() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<SubscriptionTermRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/subscriptions/get-terms',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<SubscriptionTermRM> _value;
    try {
      _value = ApiDataResponse<SubscriptionTermRM>.fromJson(
        _result.data!,
        (json) => SubscriptionTermRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiMessageDataResponse<dynamic>> subscribe() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiMessageDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/subscriptions/subscribe',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiMessageDataResponse<dynamic> _value;
    try {
      _value = ApiMessageDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiMessageDataResponse<dynamic>> unsubscribe() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiMessageDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/subscriptions/unsubscribe',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiMessageDataResponse<dynamic> _value;
    try {
      _value = ApiMessageDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<FaqRM>>> getFaqs({
    int page = 1,
    int limit = 1000,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<FaqRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/faqs?published=1',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<FaqRM>> _value;
    try {
      _value = ApiDataResponse<List<FaqRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<FaqRM>((i) => FaqRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ResourceRM>>> getResources({
    required int page,
    required int limit,
    String? search,
    String? resourceFormat,
    String? subjectId,
    String scopeKey = 'privacyFilter',
    required String userType,
    String sortField = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'search[value]': search,
      r'resource_format': resourceFormat,
      r'subjects->id[]': subjectId,
      r'scopes[0][name]': scopeKey,
      r'scopes[0][parameters][0]': userType,
      r'sort[0][field]': sortField,
      r'sort[0][direction]': direction,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<ResourceRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/resources',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ResourceRM>> _value;
    try {
      _value = ApiDataResponse<List<ResourceRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ResourceRM>(
                    (i) => ResourceRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ResourceRM>>> getResourcesByCourseId({
    required String courseId,
    int page = 1,
    int limit = 99999,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<ResourceRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/${courseId}/get-related-resources',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ResourceRM>> _value;
    try {
      _value = ApiDataResponse<List<ResourceRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ResourceRM>(
                    (i) => ResourceRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ResourceFormatRM>>> getResourceFormats() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<ResourceFormatRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/resoure-formats',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ResourceFormatRM>> _value;
    try {
      _value = ApiDataResponse<List<ResourceFormatRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ResourceFormatRM>(
                    (i) => ResourceFormatRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<SubjectRM>>> getSubjects() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<SubjectRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/subjects',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<SubjectRM>> _value;
    try {
      _value = ApiDataResponse<List<SubjectRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<SubjectRM>(
                    (i) => SubjectRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NotificationListResponse> getNotificationsData(
      {int limit = 1000}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'limit': limit};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NotificationListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/notifications',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NotificationListResponse _value;
    try {
      _value = NotificationListResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<FcmTokenResponseRM> setFcmToken({required String token}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'fcm_token': token};
    final _options = _setStreamType<FcmTokenResponseRM>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/notifications/set-fcn-token',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FcmTokenResponseRM _value;
    try {
      _value = FcmTokenResponseRM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<NotificationDetailResponseRM> getNotificationDetail(
      {required String notiId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NotificationDetailResponseRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/notifications/${notiId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NotificationDetailResponseRM _value;
    try {
      _value = NotificationDetailResponseRM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> getChatGPTMessage({required String prompt}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'prompt': prompt};
    final _options = _setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/chat-gpt',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CommunityVideoRM>>> getCommunityVideos({
    required int page,
    required int limit,
    required String type,
    String? search,
    String sort = 'id',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'type': type,
      r'search[value]': search,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<CommunityVideoRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/community-videos',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CommunityVideoRM>> _value;
    try {
      _value = ApiDataResponse<List<CommunityVideoRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CommunityVideoRM>(
                    (i) => CommunityVideoRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CommunityVideoRM>>> getRelatedCommunityVideos({
    String filterField = 'id',
    String operator = '!=',
    required int id,
    required int limit,
    required String type,
    String sort = 'id',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'filters[0][field]': filterField,
      r'filters[0][operator]': operator,
      r'filters[0][value]': id,
      r'limit': limit,
      r'type': type,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<CommunityVideoRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/community-videos',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CommunityVideoRM>> _value;
    try {
      _value = ApiDataResponse<List<CommunityVideoRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CommunityVideoRM>(
                    (i) => CommunityVideoRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<CommunityVideoRM>> getCommunityVideoById({
    required int id,
    int? viewCount,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'view': viewCount};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<CommunityVideoRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/community-videos/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<CommunityVideoRM> _value;
    try {
      _value = ApiDataResponse<CommunityVideoRM>.fromJson(
        _result.data!,
        (json) => CommunityVideoRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<HomePageVideoRM>> getHomePageVideo() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<HomePageVideoRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/home-page-video',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<HomePageVideoRM> _value;
    try {
      _value = ApiDataResponse<HomePageVideoRM>.fromJson(
        _result.data!,
        (json) => HomePageVideoRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<Version>> getCurrentVersion() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<Version>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/get-mobile-app-version',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<Version> _value;
    try {
      _value = ApiDataResponse<Version>.fromJson(
        _result.data!,
        (json) => Version.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<OfflineContentRM>> getOfflineContent() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<OfflineContentRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/get-offline-content-step-by-step',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<OfflineContentRM> _value;
    try {
      _value = ApiDataResponse<OfflineContentRM>.fromJson(
        _result.data!,
        (json) => OfflineContentRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<SlideRM>>> getSlides() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<SlideRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/slides',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<SlideRM>> _value;
    try {
      _value = ApiDataResponse<List<SlideRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<SlideRM>(
                    (i) => SlideRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<UserManualResponseRM>> getUserManuals(
      {String type = 'all'}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<UserManualResponseRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user-manuals',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<UserManualResponseRM> _value;
    try {
      _value = ApiDataResponse<UserManualResponseRM>.fromJson(
        _result.data!,
        (json) => UserManualResponseRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CmsMenuRM>>> getCmsMenus({
    int includeBaseUrl = 1,
    int showOnMobile = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'base_url': includeBaseUrl,
      r'show_mobile': showOnMobile,
    };
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<CmsMenuRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/pages/menu',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CmsMenuRM>> _value;
    try {
      _value = ApiDataResponse<List<CmsMenuRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CmsMenuRM>(
                    (i) => CmsMenuRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CourseCategoryRM>>> getCourseCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'None'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<CourseCategoryRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/course-categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CourseCategoryRM>> _value;
    try {
      _value = ApiDataResponse<List<CourseCategoryRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CourseCategoryRM>(
                    (i) => CourseCategoryRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CourseRM>>> getCourses({
    required String keyword,
    int? categoryId,
    required int page,
    required int limit,
    required String include,
    int isPublished = 1,
    int approvalStatus = 1,
    String sort = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search[value]': keyword,
      r'course_categories': categoryId,
      r'page': page,
      r'limit': limit,
      r'include': include,
      r'is_published': isPublished,
      r'approval_status': approvalStatus,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<CourseRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CourseRM>> _value;
    try {
      _value = ApiDataResponse<List<CourseRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CourseRM>(
                    (i) => CourseRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<MyCourseListResponse>> getUserCourses({
    required String keyword,
    int? categoryId,
    required String status,
    required String include,
    int isPublished = 1,
    int approvalStatus = 1,
    String sort = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': keyword,
      r'course_categories': categoryId,
      r'progress': status,
      r'include': include,
      r'is_published': isPublished,
      r'approval_status': approvalStatus,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<MyCourseListResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/courses/my-courses',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<MyCourseListResponse> _value;
    try {
      _value = ApiDataResponse<MyCourseListResponse>.fromJson(
        _result.data!,
        (json) => MyCourseListResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<CourseRM>> getCourse({
    required int courseId,
    required String include,
    String withParams = 'ordered,info',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'include': include,
      r'with': withParams,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<CourseRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/${courseId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<CourseRM> _value;
    try {
      _value = ApiDataResponse<CourseRM>.fromJson(
        _result.data!,
        (json) => CourseRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<CourseRM>> getUserCourse({
    required int courseId,
    required String include,
    String withParams = 'ordered,info',
    int auth = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'include': include,
      r'with': withParams,
      r'_auth': auth,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<CourseRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/${courseId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<CourseRM> _value;
    try {
      _value = ApiDataResponse<CourseRM>.fromJson(
        _result.data!,
        (json) => CourseRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<XApiCourseRM> getXApiCourse({required int courseId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<XApiCourseRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/${courseId}/get-completion-status-from-sc',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late XApiCourseRM _value;
    try {
      _value = XApiCourseRM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<CourseLearnerRM>> getCourseLearner(
      {required int learnerId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<CourseLearnerRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/course-learners/${learnerId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<CourseLearnerRM> _value;
    try {
      _value = ApiDataResponse<CourseLearnerRM>.fromJson(
        _result.data!,
        (json) => CourseLearnerRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<CourseLearnerRM>> takeCourse(
      {required int courseId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<CourseLearnerRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/take-course/${courseId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<CourseLearnerRM> _value;
    try {
      _value = ApiDataResponse<CourseLearnerRM>.fromJson(
        _result.data!,
        (json) => CourseLearnerRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<LectureRM>> getLecture({
    required int lectureId,
    String include = 'interactiveFeatures',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<LectureRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/lectures/${lectureId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<LectureRM> _value;
    try {
      _value = ApiDataResponse<LectureRM>.fromJson(
        _result.data!,
        (json) => LectureRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<LearningActivityRM>> getLearningActivity({
    required int activityId,
    String include = 'interactiveFeatures',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<LearningActivityRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/learning-activities/${activityId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<LearningActivityRM> _value;
    try {
      _value = ApiDataResponse<LearningActivityRM>.fromJson(
        _result.data!,
        (json) => LearningActivityRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<LearningQuizRM>> getLearningQuiz({
    required int quizId,
    required String includes,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': includes};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<LearningQuizRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/quizzes/${quizId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<LearningQuizRM> _value;
    try {
      _value = ApiDataResponse<LearningQuizRM>.fromJson(
        _result.data!,
        (json) => LearningQuizRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<LearningQuizAssignmentUserAnswerRM>>>
      getLearningQuizAssignmentUserAnswers({
    required int userId,
    required int assignmentId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'assignment_id': assignmentId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<
        ApiDataResponse<List<LearningQuizAssignmentUserAnswerRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/assignment-users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<LearningQuizAssignmentUserAnswerRM>> _value;
    try {
      _value =
          ApiDataResponse<List<LearningQuizAssignmentUserAnswerRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<LearningQuizAssignmentUserAnswerRM>((i) =>
                    LearningQuizAssignmentUserAnswerRM.fromJson(
                        i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<LearningSummaryRM>> getLearningSummary({
    required int summaryId,
    String include = 'interactiveFeatures',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<LearningSummaryRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/summaries/${summaryId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<LearningSummaryRM> _value;
    try {
      _value = ApiDataResponse<LearningSummaryRM>.fromJson(
        _result.data!,
        (json) => LearningSummaryRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<LiveSessionRM>> getLiveSession(
      {required int sessionId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<LiveSessionRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/live-sessions/${sessionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<LiveSessionRM> _value;
    try {
      _value = ApiDataResponse<LiveSessionRM>.fromJson(
        _result.data!,
        (json) => LiveSessionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<EvaluationResponseRM>> getEvaluation(
      {required int courseId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<EvaluationResponseRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/evaluation-users/evaluations/${courseId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<EvaluationResponseRM> _value;
    try {
      _value = ApiDataResponse<EvaluationResponseRM>.fromJson(
        _result.data!,
        (json) => EvaluationResponseRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<AssessmentQuestionRM>>> getAssessmentQuestions({
    required int courseId,
    int limit = 99999,
    String include = 'current_assessment_user',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'course_id': courseId,
      r'limit': limit,
      r'include': include,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<AssessmentQuestionRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/assessment-question-answers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<AssessmentQuestionRM>> _value;
    try {
      _value = ApiDataResponse<List<AssessmentQuestionRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<AssessmentQuestionRM>((i) =>
                    AssessmentQuestionRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<AssessmentQuestionRM>> getAssessmentQuestion({
    required int questionId,
    String include = 'current_assessment_user',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<AssessmentQuestionRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/assessment-question-answers/${questionId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<AssessmentQuestionRM> _value;
    try {
      _value = ApiDataResponse<AssessmentQuestionRM>.fromJson(
        _result.data!,
        (json) => AssessmentQuestionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UpdateCompletionResponse> updateCompletion({
    required int courseId,
    required String currentSection,
    required String redirect,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'current_section': currentSection,
      'redirect': redirect,
    };
    final _options = _setStreamType<UpdateCompletionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/update-completion/${courseId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateCompletionResponse _value;
    try {
      _value = UpdateCompletionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> postQuizLongAnswer({
    required int courseId,
    required int quizId,
    required int longAnswerId,
    required String answer,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'long_answer_id': longAnswerId,
      'answers': answer,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/courses/${courseId}/quizzes/${quizId}/submit-long-answer',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> postQuizShortAnswer(
      {required Map<String, dynamic> body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/courses/submit-short-answer',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ApiMessageDataResponse<dynamic>>> postAssignment({
    required int courseId,
    required int quizId,
    required int assignmentId,
    required String redirect,
    required String currentSection,
    required File file,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'assignment_id',
      assignmentId.toString(),
    ));
    _data.fields.add(MapEntry(
      'redirect',
      redirect,
    ));
    _data.fields.add(MapEntry(
      'current_section',
      currentSection,
    ));
    _data.files.add(MapEntry(
      'assignment_file',
      MultipartFile.fromFileSync(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _options =
        _setStreamType<ApiDataResponse<ApiMessageDataResponse<dynamic>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/courses/${courseId}/quizzes/${quizId}/submit-assignment',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ApiMessageDataResponse<dynamic>> _value;
    try {
      _value = ApiDataResponse<ApiMessageDataResponse<dynamic>>.fromJson(
        _result.data!,
        (json) => ApiMessageDataResponse<dynamic>.fromJson(
          json as Map<String, dynamic>,
          (json) => json as dynamic,
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> postAssessmentAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required List<String> answers,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'answers': answers};
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/course/${courseId}/assessments/${assessmentQuestionId}/save',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> putAssessmentAnswer({
    required int courseId,
    required int assessmentId,
    required int assessmentUserAnswerId,
    required List<String> answers,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'id': assessmentUserAnswerId,
      'answers': answers,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/course/${courseId}/assessments/${assessmentId}/update',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<AssessmentUserAnswerRM>>>
      getAssessmentUserAnswers({
    required int courseId,
    required int assessmentQuestionId,
    required int userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'course_id': courseId,
      r'assessment_question_answer_id': assessmentQuestionId,
      r'user_id': userId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<AssessmentUserAnswerRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/assessment-users',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<AssessmentUserAnswerRM>> _value;
    try {
      _value = ApiDataResponse<List<AssessmentUserAnswerRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<AssessmentUserAnswerRM>((i) =>
                    AssessmentUserAnswerRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<AssessmentSubmissionResultRM>> submitAssessment(
      {required int courseId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<AssessmentSubmissionResultRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/course/${courseId}/assessments/submit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<AssessmentSubmissionResultRM> _value;
    try {
      _value = ApiDataResponse<AssessmentSubmissionResultRM>.fromJson(
        _result.data!,
        (json) =>
            AssessmentSubmissionResultRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<String>> postEvaluationAnswers({
    required int courseId,
    required List<String> answers,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'feedbacks[]': answers};
    final _options = _setStreamType<ApiDataResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/courses/${courseId}/evaluations/submit',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<String> _value;
    try {
      _value = ApiDataResponse<String>.fromJson(
        _result.data!,
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<CertificateResponse> getCertificate({required int courseId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<CertificateResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/${courseId}/generate-certi',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CertificateResponse _value;
    try {
      _value = CertificateResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> cancelCourse({required int courseId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/courses/${courseId}/cancel-course',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CourseReviewRM>>> getCourseReviews({
    required int courseId,
    String include = 'user',
    int limit = 99999,
    String sort = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'course_id': courseId,
      r'include': include,
      r'limit': limit,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<CourseReviewRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/rating-reviews',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CourseReviewRM>> _value;
    try {
      _value = ApiDataResponse<List<CourseReviewRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CourseReviewRM>(
                    (i) => CourseReviewRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<CourseDiscussionMessageRM>>>
      getDiscussionMessages({
    required int courseId,
    String include = 'user',
    int limit = 99999,
    String sort = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'discussion->course_id': courseId,
      r'include': include,
      r'limit': limit,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<CourseDiscussionMessageRM>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/discussion-messages',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<CourseDiscussionMessageRM>> _value;
    try {
      _value = ApiDataResponse<List<CourseDiscussionMessageRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<CourseDiscussionMessageRM>((i) =>
                    CourseDiscussionMessageRM.fromJson(
                        i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> createCourseReview({
    required int courseId,
    required int rating,
    required String remark,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'course_id': courseId,
      'rating': rating,
      'remark': remark,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/rating-reviews',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> createDiscussionMessage({
    required int courseId,
    required int discussionId,
    required String message,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'course_id': courseId,
      'discussion_id': discussionId,
      'message': message,
    };
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/discussion-messages',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<BlogPostCategoryRM>>>
      getBlogPostCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<BlogPostCategoryRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blog-categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<BlogPostCategoryRM>> _value;
    try {
      _value = ApiDataResponse<List<BlogPostCategoryRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<BlogPostCategoryRM>((i) =>
                    BlogPostCategoryRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<BlogPostRM>>> getLatestBlogPosts({
    String sortField = 'created_at',
    String direction = 'desc',
    int published = 1,
    int limit = 99999,
    String? include = 'user',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sort[0][field]': sortField,
      r'sort[0][direction]': direction,
      r'published': published,
      r'limit': limit,
      r'include': include,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<BlogPostRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blogs',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<BlogPostRM>> _value;
    try {
      _value = ApiDataResponse<List<BlogPostRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<BlogPostRM>(
                    (i) => BlogPostRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<BlogPostRM>>> getRecommendedBlogPosts({
    String sortField = 'created_at',
    String direction = 'desc',
    int published = 1,
    String? include = 'user,categories,tags',
    int limit = 999999,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sort[0][field]': sortField,
      r'sort[0][direction]': direction,
      r'published': published,
      r'include': include,
      r'limit': limit,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<BlogPostRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blogs',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<BlogPostRM>> _value;
    try {
      _value = ApiDataResponse<List<BlogPostRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<BlogPostRM>(
                    (i) => BlogPostRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<BlogPostRM>>> searchBlogPosts({
    String? query,
    String? commaSeparatedCategoryIds,
    String? commaSeparatedTagIds,
    int published = 1,
    String? include = 'user,categories,tags',
    int limit = 999999,
    String sortField = 'created_at',
    String sortDirection = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search[value]=': query,
      r'categories': commaSeparatedCategoryIds,
      r'tags': commaSeparatedTagIds,
      r'published': published,
      r'include': include,
      r'limit': limit,
      r'sort[0][field]': sortField,
      r'sort[0][direction]': sortDirection,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<List<BlogPostRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blogs',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<BlogPostRM>> _value;
    try {
      _value = ApiDataResponse<List<BlogPostRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<BlogPostRM>(
                    (i) => BlogPostRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<BlogPostRM>> getBlogPostDetails({
    required int postId,
    String? include = 'user,categories,tags',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<BlogPostRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blogs/${postId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<BlogPostRM> _value;
    try {
      _value = ApiDataResponse<BlogPostRM>.fromJson(
        _result.data!,
        (json) => BlogPostRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<BlogPostCommentRM>>> getBlogPostComments(
      {required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<BlogPostCommentRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blogs/${postId}/comments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<BlogPostCommentRM>> _value;
    try {
      _value = ApiDataResponse<List<BlogPostCommentRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<BlogPostCommentRM>((i) =>
                    BlogPostCommentRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<BlogPostCommentRM>> postBlogPostComment({
    required int postId,
    required String text,
    int active = 1,
    File? image,
    File? video,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'blog_id',
      postId.toString(),
    ));
    _data.fields.add(MapEntry(
      'description',
      text,
    ));
    _data.fields.add(MapEntry(
      'active',
      active.toString(),
    ));
    if (image != null) {
      _data.files.add(MapEntry(
        'comment_img',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (video != null) {
      _data.files.add(MapEntry(
        'uploaded_video',
        MultipartFile.fromFileSync(
          video.path,
          filename: video.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _options = _setStreamType<ApiDataResponse<BlogPostCommentRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/blog-comments',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<BlogPostCommentRM> _value;
    try {
      _value = ApiDataResponse<BlogPostCommentRM>.fromJson(
        _result.data!,
        (json) => BlogPostCommentRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<BlogPostCommentRM>> putBlogPostComment({
    required int commentId,
    required int postId,
    required String text,
    int active = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'blog_id',
      postId.toString(),
    ));
    _data.fields.add(MapEntry(
      'description',
      text,
    ));
    _data.fields.add(MapEntry(
      'active',
      active.toString(),
    ));
    final _options = _setStreamType<ApiDataResponse<BlogPostCommentRM>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          '/blog-comments/${commentId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<BlogPostCommentRM> _value;
    try {
      _value = ApiDataResponse<BlogPostCommentRM>.fromJson(
        _result.data!,
        (json) => BlogPostCommentRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteBlogPostComment({required int commentId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-comments/${commentId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  @override
  Future<ApiDataResponse<ReactionRM>> createBlogPostReaction({
    required int postId,
    required String reaction,
    String reactionTo = 'post',
    int active = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'reaction_to_id': postId,
      'reaction_type': reaction,
      'reaction_to_type': reactionTo,
      'active': active,
    };
    final _options = _setStreamType<ApiDataResponse<ReactionRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-reactions',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ReactionRM> _value;
    try {
      _value = ApiDataResponse<ReactionRM>.fromJson(
        _result.data!,
        (json) => ReactionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ReactionRM>> updateBlogPostReaction({
    required int reactionId,
    required String reaction,
    required int postId,
    String reactionTo = 'post',
    int active = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'reaction_type': reaction,
      'reaction_to_id': postId,
      'reaction_to_type': reactionTo,
      'active': active,
    };
    final _options = _setStreamType<ApiDataResponse<ReactionRM>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-reactions/${reactionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ReactionRM> _value;
    try {
      _value = ApiDataResponse<ReactionRM>.fromJson(
        _result.data!,
        (json) => ReactionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> deleteBlogPostReaction({required int reactionId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-reactions/${reactionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<ApiDataResponse<ReactionRM>> createBlogPostCommentReaction({
    required int commentId,
    required String reaction,
    String reactionTo = 'comment',
    int active = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'reaction_to_id': commentId,
      'reaction_type': reaction,
      'reaction_to_type': reactionTo,
      'active': active,
    };
    final _options = _setStreamType<ApiDataResponse<ReactionRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-reactions',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ReactionRM> _value;
    try {
      _value = ApiDataResponse<ReactionRM>.fromJson(
        _result.data!,
        (json) => ReactionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ReactionRM>> updateBlogPostCommentReaction({
    required int reactionId,
    required int commentId,
    required String reaction,
    String reactionTo = 'comment',
    int active = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'reaction_to_id': commentId,
      'reaction_type': reaction,
      'reaction_to_type': reactionTo,
      'active': active,
    };
    final _options = _setStreamType<ApiDataResponse<ReactionRM>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-reactions/${reactionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ReactionRM> _value;
    try {
      _value = ApiDataResponse<ReactionRM>.fromJson(
        _result.data!,
        (json) => ReactionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> deleteBlogPostCommentReaction(
      {required int reactionId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-reactions/${reactionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<ApiDataResponse<List<BlogPostQuizQuestionRM>>>
      getBlogPostQuizQuestions({
    required String postId,
    required List<String> includes,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': includes};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<BlogPostQuizQuestionRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blog-posts/${postId}/get-surveys',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<BlogPostQuizQuestionRM>> _value;
    try {
      _value = ApiDataResponse<List<BlogPostQuizQuestionRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<BlogPostQuizQuestionRM>((i) =>
                    BlogPostQuizQuestionRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> saveBlogPostQuizUserAnswers({
    required int postId,
    required int questionId,
    required Map<String, dynamic> answers,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(answers);
    final _options = _setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/blog-posts/${postId}/assessments/${questionId}/save',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> updateBlogPostQuizUserAnswers({
    required int postId,
    required int questionId,
    required Map<String, dynamic> answers,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(answers);
    final _options = _setStreamType<dynamic>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/blog-posts/${postId}/assessments/${questionId}/update',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<ApiDataResponse<BlogPostQuizUserAnswerResultRM>>
      submitBlogPostQuizUserAnswer({required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<BlogPostQuizUserAnswerResultRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blog-posts/${postId}/assessments/submit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<BlogPostQuizUserAnswerResultRM> _value;
    try {
      _value = ApiDataResponse<BlogPostQuizUserAnswerResultRM>.fromJson(
        _result.data!,
        (json) => BlogPostQuizUserAnswerResultRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BlogPostQuizUserAnswerResultRM> markBlogPostAsRead(
      {required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BlogPostQuizUserAnswerResultRM>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blog-posts/${postId}/mark-as-read',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BlogPostQuizUserAnswerResultRM _value;
    try {
      _value = BlogPostQuizUserAnswerResultRM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> trackBlogView({required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blogs/count/${postId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> trackBlogShare({required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/blogs/share/${postId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  @override
  Future<ApiPaginatedResponse<ThematicGroupListingRM>> getUserGroups({
    required int page,
    required int limit,
    int self = 1,
    String? keyword,
    String? categories,
    required String include,
    String sortField = 'created_at',
    String sortDirection = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'self': self,
      r'search[value]': keyword,
      r'group_categories': categories,
      r'include': include,
      r'sort[0][field]': sortField,
      r'sort[0][direction]': sortDirection,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiPaginatedResponse<ThematicGroupListingRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-groups',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiPaginatedResponse<ThematicGroupListingRM> _value;
    try {
      _value = ApiPaginatedResponse<ThematicGroupListingRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupListingRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiPaginatedResponse<ThematicGroupListingRM>> getRecommendGroups({
    required int page,
    required int limit,
    int self = -1,
    String? keyword,
    String? categories,
    required String include,
    String sortField = 'created_at',
    String sortDirection = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'self': self,
      r'search[value]': keyword,
      r'group_categories': categories,
      r'include': include,
      r'sort[0][field]': sortField,
      r'sort[0][direction]': sortDirection,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiPaginatedResponse<ThematicGroupListingRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-groups',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiPaginatedResponse<ThematicGroupListingRM> _value;
    try {
      _value = ApiPaginatedResponse<ThematicGroupListingRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupListingRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupListingRM>> getGroup({
    required String groupId,
    required String include,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupListingRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-groups/${groupId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupListingRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupListingRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupListingRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupRequestResponseRM>> requestToJoinGroup({
    required String tgroup_id,
    required String user_id,
    required int approval_status,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'tgroup_id': tgroup_id,
      'user_id': user_id,
      'approval_status': approval_status,
    };
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupRequestResponseRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-requests',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupRequestResponseRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupRequestResponseRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupRequestResponseRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ThematicGroupPostRM>>> getPostsList({
    int? page,
    int? limit,
    required String group_id,
    required int active,
    String sort = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'tgroup_id': group_id,
      r'active': active,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<ThematicGroupPostRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-posts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ThematicGroupPostRM>> _value;
    try {
      _value = ApiDataResponse<List<ThematicGroupPostRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ThematicGroupPostRM>((i) =>
                    ThematicGroupPostRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostRM>> getGroupPost(
      {required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-posts/${postId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCreateResponseRM>> createPost({
    required String description,
    required String tgroupId,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'tgroup_id',
      tgroupId,
    ));
    if (uploadedFile != null) {
      _data.files.add(MapEntry(
        'tgroup_post_uploaded_file',
        MultipartFile.fromFileSync(
          uploadedFile.path,
          filename: uploadedFile.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (uploadedVideo != null) {
      _data.files.add(MapEntry(
        'tgroup_post_uploaded_video',
        MultipartFile.fromFileSync(
          uploadedVideo.path,
          filename: uploadedVideo.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCreateResponseRM>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/thematic-group-posts',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCreateResponseRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCreateResponseRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostCreateResponseRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCreateResponseRM>> EditPost({
    required String postId,
    required String description,
    required String tgroupId,
    File? uploadedFile,
    File? uploadedVideo,
    String method = "put",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'tgroup_id',
      tgroupId,
    ));
    if (uploadedFile != null) {
      _data.files.add(MapEntry(
        'tgroup_post_uploaded_file',
        MultipartFile.fromFileSync(
          uploadedFile.path,
          filename: uploadedFile.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (uploadedVideo != null) {
      _data.files.add(MapEntry(
        'tgroup_post_uploaded_video',
        MultipartFile.fromFileSync(
          uploadedVideo.path,
          filename: uploadedVideo.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCreateResponseRM>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
                .compose(
                  _dio.options,
                  '/thematic-group-posts/${postId}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCreateResponseRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCreateResponseRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostCreateResponseRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ThematicGroupPostCommentRM>>> getCommentsList({
    required int page,
    required int limit,
    required String post_id,
    String sort = 'created_at',
    String direction = 'desc',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'tgroup_post_id': post_id,
      r'sort[0][field]': sort,
      r'sort[0][direction]': direction,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<ThematicGroupPostCommentRM>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/thematic-group-post-comments',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ThematicGroupPostCommentRM>> _value;
    try {
      _value = ApiDataResponse<List<ThematicGroupPostCommentRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ThematicGroupPostCommentRM>((i) =>
                    ThematicGroupPostCommentRM.fromJson(
                        i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> deleteComment({required int commentId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/thematic-group-post-comments/${commentId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<dynamic> deleteReply({required int replyId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/thematic-group-post-comment-replies/${replyId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<ThematicGroupRulesResponseRM> getGroupRules() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ThematicGroupRulesResponseRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/get-group-rules',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ThematicGroupRulesResponseRM _value;
    try {
      _value = ThematicGroupRulesResponseRM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ThematicGroupCategoryRM>>> getCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<ThematicGroupCategoryRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ThematicGroupCategoryRM>> _value;
    try {
      _value = ApiDataResponse<List<ThematicGroupCategoryRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ThematicGroupCategoryRM>((i) =>
                    ThematicGroupCategoryRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ReactionRM>> createThematicGroupReaction({
    required String groupId,
    required String reactionType,
    required String reactionToType,
    required String reactionToId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'tgroup_id': groupId,
      'reaction_type': reactionType,
      'reaction_to_type': reactionToType,
      'reaction_to_id': reactionToId,
    };
    final _options = _setStreamType<ApiDataResponse<ReactionRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/thematic-group-reactions',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ReactionRM> _value;
    try {
      _value = ApiDataResponse<ReactionRM>.fromJson(
        _result.data!,
        (json) => ReactionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ReactionRM>> updateThematicGroupReaction({
    required int reactionId,
    required String reactionType,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'reaction_type': reactionType};
    final _options = _setStreamType<ApiDataResponse<ReactionRM>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/thematic-group-reactions/${reactionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ReactionRM> _value;
    try {
      _value = ApiDataResponse<ReactionRM>.fromJson(
        _result.data!,
        (json) => ReactionRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> deleteThematicGroupReaction({required int reactionId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<dynamic>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/thematic-group-reactions/${reactionId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCommentRM>> createPostComment({
    required String description,
    required String tgroup_post_id,
    File? uploadedImage,
    File? uploadedVideo,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'tgroup_post_id',
      tgroup_post_id,
    ));
    if (uploadedImage != null) {
      _data.files.add(MapEntry(
        'tgroup_post_comment_img',
        MultipartFile.fromFileSync(
          uploadedImage.path,
          filename: uploadedImage.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (uploadedVideo != null) {
      _data.files.add(MapEntry(
        'tgroup_post_comment_video',
        MultipartFile.fromFileSync(
          uploadedVideo.path,
          filename: uploadedVideo.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCommentRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-post-comments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCommentRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCommentRM>.fromJson(
        _result.data!,
        (json) =>
            ThematicGroupPostCommentRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCommentRM>> updatePostComment({
    required int commentId,
    required String description,
    String method = "put",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCommentRM>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-post-comments/${commentId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCommentRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCommentRM>.fromJson(
        _result.data!,
        (json) =>
            ThematicGroupPostCommentRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCommentReplyRM>>
      createThematicGroupPostReply({
    required String description,
    String comment_type = 'comment',
    required String comment_id,
    required String reply_id,
    File? uploadedImage,
    File? uploadedVideo,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      'comment_type',
      comment_type,
    ));
    _data.fields.add(MapEntry(
      'comment_id',
      comment_id,
    ));
    _data.fields.add(MapEntry(
      'reply_id',
      reply_id,
    ));
    if (uploadedImage != null) {
      _data.files.add(MapEntry(
        'tgroup_post_com_reply_img',
        MultipartFile.fromFileSync(
          uploadedImage.path,
          filename: uploadedImage.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    if (uploadedVideo != null) {
      _data.files.add(MapEntry(
        'tgroup_post_com_reply_video',
        MultipartFile.fromFileSync(
          uploadedVideo.path,
          filename: uploadedVideo.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCommentReplyRM>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/thematic-group-post-comment-replies',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCommentReplyRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCommentReplyRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostCommentReplyRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCommentReplyRM>>
      updateThematicGroupPostReply({
    required int replyId,
    required String description,
    String method = "put",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'description',
      description,
    ));
    _data.fields.add(MapEntry(
      '_method',
      method,
    ));
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCommentReplyRM>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/thematic-group-post-comment-replies/${replyId}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCommentReplyRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCommentReplyRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostCommentReplyRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ThematicGroupPostCreateResponseRM>> deleteGroupPost(
      {required int postId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<ThematicGroupPostCreateResponseRM>>(
            Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/thematic-group-posts/${postId}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ThematicGroupPostCreateResponseRM> _value;
    try {
      _value = ApiDataResponse<ThematicGroupPostCreateResponseRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostCreateResponseRM.fromJson(
            json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<String>> leaveGroup({
    required int groupId,
    required String leaveOption,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'leave_option': leaveOption};
    final _options = _setStreamType<ApiDataResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/thematic-groups/${groupId}/leave-group',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<String> _value;
    try {
      _value = ApiDataResponse<String>.fromJson(
        _result.data!,
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<GroupPostDetailsDataRM>> getPostDetails({
    required String postId,
    required String include,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'include': include};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<GroupPostDetailsDataRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-posts/${postId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<GroupPostDetailsDataRM> _value;
    try {
      _value = ApiDataResponse<GroupPostDetailsDataRM>.fromJson(
        _result.data!,
        (json) => GroupPostDetailsDataRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiPaginatedResponse<ThematicGroupPostRM>> getGroupApprovedPosts({
    required int groupId,
    required int userId,
    int active = 1,
    required int page,
    required int limit,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'tgroup_id': groupId,
      r'user_id': userId,
      r'active': active,
      r'page': page,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiPaginatedResponse<ThematicGroupPostRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-posts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiPaginatedResponse<ThematicGroupPostRM> _value;
    try {
      _value = ApiPaginatedResponse<ThematicGroupPostRM>.fromJson(
        _result.data!,
        (json) => ThematicGroupPostRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<List<ThematicGroupPostRM>>> getGroupPendingPosts({
    required int groupId,
    required int userId,
    int active = 0,
    required int page,
    required int limit,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'tgroup_id': groupId,
      r'user_id': userId,
      r'active': active,
      r'page': page,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiDataResponse<List<ThematicGroupPostRM>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/thematic-group-posts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<List<ThematicGroupPostRM>> _value;
    try {
      _value = ApiDataResponse<List<ThematicGroupPostRM>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ThematicGroupPostRM>((i) =>
                    ThematicGroupPostRM.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<ContactInfoRM>> getContactInfo() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<ContactInfoRM>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/contact-info',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<ContactInfoRM> _value;
    try {
      _value = ApiDataResponse<ContactInfoRM>.fromJson(
        _result.data!,
        (json) => ContactInfoRM.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiDataResponse<dynamic>> getContactRegions() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiDataResponse<dynamic>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/region-list',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiDataResponse<dynamic> _value;
    try {
      _value = ApiDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiMessageDataResponse<dynamic>> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String phone,
    required String organization,
    int? regionId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
      'phone_no': phone,
      'organization': organization,
      'region_state': regionId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<ApiMessageDataResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/contact-us',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiMessageDataResponse<dynamic> _value;
    try {
      _value = ApiMessageDataResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
