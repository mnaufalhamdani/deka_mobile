import 'package:deka_mobile/models/entities/profile/profile.dart';
import 'package:deka_mobile/repository/login_repository.dart';

import '../../core/data/data_state.dart';

abstract class GetLoginUseCaseImpl<Type, Params> {
  Future<Type> getLogin({Params username, Params password});
  Future<Type> getProfile();
}

class GetLoginUseCase implements GetLoginUseCaseImpl<DataState<ProfileEntity>, String> {
  final LoginRepository _repository;
  GetLoginUseCase(this._repository);

  @override
  Future<DataState<ProfileEntity>> getLogin({String ? username, String ? password}) {
    return _repository.getLogin(username!, password!);
  }

  @override
  Future<DataState<ProfileEntity>> getProfile() {
    return _repository.getProfile();
  }
  
}