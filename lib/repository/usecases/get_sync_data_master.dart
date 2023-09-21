import 'package:deka_mobile/models/response/sync_data_master_model.dart';

import '../../core/data/data_state.dart';
import '../sync_data_master_repository.dart';

abstract class SyncDataMasterUseCaseImpl<Type, Params> {
  Future<Type> syncDataMaster();
}

class SyncDataMasterUseCase implements SyncDataMasterUseCaseImpl<DataState<SyncDataMasterModel>, String> {
  final SyncDataMasterRepository _repository;
  SyncDataMasterUseCase(this._repository);

  @override
  Future<DataState<SyncDataMasterModel>> syncDataMaster() {
    return _repository.syncDataMaster();
  }
}