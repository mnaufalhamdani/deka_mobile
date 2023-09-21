import 'dart:io';

import 'package:deka_mobile/extensions/constants.dart';
import 'package:deka_mobile/models/response/sync_data_master_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/response/error_model.dart';

part 'sync_data_master_service_impl.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SyncDataMasterService {
  factory SyncDataMasterService(Dio dio) = SyncDataMasterServiceImpl;

  @FormUrlEncoded()
  @POST('sync-data-master')
  Future<HttpResponse<SyncDataMasterModel>> syncDataMaster({
    @Query("user_id") String ? user_id,
    @Query("date") String ? date,
    @Field("slug_database") String ? slug_database
  });
}