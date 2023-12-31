import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_app/repository/models/response_api.dart';

import 'package:starter_app/repository/models/user_model.dart';
import 'package:starter_app/repository/reqres_api_service.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ReqresApiService reqresApiService;
  UserBloc(
    this.reqresApiService,
  ) : super(const _Initial()) {
    on<UserEvent>((event, emit) async {
      emit(const UserState.loading());
      try {
        final ResponseApi responseApi = await reqresApiService.getUsers();
        final List<UserModel> data = responseApi.data;
        emit(UserState.success(users: data));
      } catch (e) {
        emit(UserState.error(errorMessage: e.toString()));
      }
    });
  }
}
