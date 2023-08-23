import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/repository/models/response_api.dart';

import 'package:starter_app/repository/models/user_model.dart';
import 'package:starter_app/repository/reqres_api_service.dart';

import '../../state.dart';

part 'user_event.dart';
part 'user_state.dart';

class OldUserBloc extends Bloc<OldUserEvent, OldUserState> {
  final ReqresApiService reqresApiService;
  OldUserBloc(
    this.reqresApiService,
  ) : super(OldUserState()) {
    on<GetUserEvent>((event, emit) async {
      emit(state.copyWith(
        status: DataStateStatus.loading,
      ));

      try {
        final ResponseApi responseApi = await reqresApiService.getUsers();
        final List<UserModel> data = responseApi.data;
        emit(state.copyWith(
          status: DataStateStatus.success,
          users: data,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: DataStateStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
