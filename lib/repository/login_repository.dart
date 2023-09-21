import 'package:deka_mobile/config/service/account/account_service.dart';

import '../config/database_config.dart';
import '../core/data/data_state.dart';
import '../models/entities/profile/profile.dart';
import '../models/mapper/profile_mapper.dart';
import '../models/response/error_model.dart';
import '../models/response/login_model.dart';

abstract class LoginRepository {
  Future<DataState<ProfileEntity>> getLogin(String username, String password);

  Future<DataState<ProfileEntity>> getProfile();

  Future<void> deleteProfileAll();

  Future<void> insertProfile(LoginModel model);
}

class LoginRepositoryImpl extends LoginRepository {
  final AccountService _accountService;
  final DatabaseConfig _databaseConfig;

  LoginRepositoryImpl(this._accountService, this._databaseConfig);

  @override
  Future<DataState<ProfileEntity>> getLogin(String username, String password) async {
    try {
      final httpResponse = await _accountService.getLogin(
          username: username,
          password: password,
          firebaseId: "Unknown"
      );

      deleteProfileAll();
      insertProfile(httpResponse.data);

      return getProfile();
    } on ErrorModel catch (e) {
      return DataFailed(e);
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