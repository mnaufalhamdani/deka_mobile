import 'dart:io';

import 'package:deka_mobile/extensions/constants.dart';
import 'package:deka_mobile/models/response/error_model.dart';
import 'package:deka_mobile/models/response/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'account_service_impl.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AccountService {
  factory AccountService(Dio dio) = AccountServiceImpl;

  @FormUrlEncoded()
  @POST('login')
  Future<HttpResponse<LoginModel>> getLogin({
    @Field("username") String ? username,
    @Field("password") String ? password,
    @Field("firebase_id") String ? firebaseId
  });
}