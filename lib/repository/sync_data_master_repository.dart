import 'package:deka_mobile/models/response/sync_data_master_model.dart';
import 'package:intl/intl.dart';

import '../config/database_config.dart';
import '../config/service/other/sync_data_master_service.dart';
import '../core/data/data_state.dart';
import '../models/entities/profile/profile.dart';
import '../models/mapper/profile_mapper.dart';
import '../models/response/error_model.dart';
import '../models/response/login_model.dart';

abstract class SyncDataMasterRepository {
  Future<DataState<SyncDataMasterModel>> syncDataMaster();

  Future<DataState<ProfileEntity>> getProfile();

  Future<void> deleteProfileAll();

  Future<void> insertProfile(LoginModel model);
}

class SyncDataMasterRepositoryImpl extends SyncDataMasterRepository {
  final SyncDataMasterService _syncDataMasterService;
  final DatabaseConfig _databaseConfig;

  SyncDataMasterRepositoryImpl(this._syncDataMasterService, this._databaseConfig);

  @override
  Future<DataState<SyncDataMasterModel>> syncDataMaster() async {
    try {
      final profile = await getProfile();
      String slugDatabase = """[{"code":"last-sync-hc_reason","count":null,"value":"0","created_at":"2022-01-21 11:22:39","status":1,"status_kirim":"NOT_SENT","updated_at":"2022-01-21 11:22:39"},{"code":"last-sync-hc_reason_type","count":null,"value":"0","created_at":"2022-01-21 11:22:39","status":1,"status_kirim":"NOT_SENT","updated_at":"2022-01-21 11:22:39"},{"code":"last-sync-hc_data_pic","count":null,"value":"0","created_at":"2022-01-21 11:22:39","status":1,"status_kirim":"NOT_SENT","updated_at":"2022-01-21 11:22:39"},{"code":"last-sync-android_auth_menu","count":null,"value":"0","created_at":"2022-01-21 11:22:39","status":1,"status_kirim":"NOT_SENT","updated_at":"2022-01-21 11:22:39"}]""";

      final httpResponse = await _syncDataMasterService.syncDataMaster(
          user_id: profile.data!.userId,
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          slug_database: slugDatabase
      );

      return DataSuccess(httpResponse.data);
    } on ErrorModel catch (e) {
      throw DataFailed(e);
    }
  }

  @override
  Future<DataState<ProfileEntity>> getProfile() async {
    final models = await _databaseConfig.profileDao.getProfile();
    if(models.isEmpty) throw DataFailed(ErrorModel());

    return DataSuccess(models.first);
  }

  @override
  Future<void> insertProfile(LoginModel model) {
    final profileMapper = ProfileMapper(model);
    return _databaseConfig.profileDao.insertProfile(profileMapper);
  }

  @override
  Future<void> deleteProfileAll() {
    return _databaseConfig.profileDao.deleteAll();
  }
}