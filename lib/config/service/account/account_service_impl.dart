// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class AccountServiceImpl implements AccountService {
  AccountServiceImpl(this._dio) {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = BASE_TIMEOUT;
    _dio.options.sendTimeout = BASE_TIMEOUT;
  }

  final Dio _dio;

  @override
  Future<HttpResponse<LoginModel>> getLogin({
    username,
    password,
    firebaseId
  }) async {
    try {
      final extra = <String, dynamic>{};
      final headers = <String, dynamic>{};
      final params = <String, dynamic>{};
      final formData = FormData.fromMap({
        'username' : username,
        'password' : password,
        'firebase_id' : firebaseId
      });

      final options = Options(method: 'POST', headers: headers, extra: extra, validateStatus: (status) => true);
      final result = await _dio.request('login',
          data: formData,
          queryParameters: params,
          options: options
      );

      if(result.statusCode == HttpStatus.ok) {
        LoginModel value = LoginModel.fromJson(result.data!['data']['profile']);
        return HttpResponse(value, result);
      } else {
        throw ErrorModel.fromRequest(result.data);
      }
    }on DioError catch (e){
      throw ErrorModel(message: e.message.toString());
    }
  }
}
