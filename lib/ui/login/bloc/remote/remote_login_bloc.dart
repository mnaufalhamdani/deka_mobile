import 'package:deka_mobile/repository/usecases/get_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/data_state.dart';
import '../../../../core/data/bloc_state.dart';
import '../../../../models/entities/profile/profile.dart';

//Bloc
class RemoteLoginBloc extends Bloc<RemoteLoginEvent, BaseBlocState>{
  final GetLoginUseCase useCase;

  RemoteLoginBloc(this.useCase) : super(BaseResponseDefault()){
    on <GetLogin> (onLoad);
  }

  void onLoad(GetLogin event, Emitter < BaseBlocState > emit) async {
    emit(BaseResponseLoading());
    final dataState = await useCase.getLogin(username: event.username, password: event.password);

    if (dataState is DataSuccess) {
      emit(LoginResponseDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(BaseResponseError(dataState.error!));
    }
  }
}

//Event
abstract class RemoteLoginEvent {
  final String ? username;
  final String ? password;
  const RemoteLoginEvent({this.username, this.password});
}

class GetLogin extends RemoteLoginEvent {
  GetLogin(String username, String password) : super(username: username, password: password);
}

//State
class LoginResponseDone extends BaseBlocState {
  final ProfileEntity model;

  LoginResponseDone(this.model);
}