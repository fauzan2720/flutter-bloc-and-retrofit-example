import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/repository/models/response_api.dart';

import 'package:starter_app/repository/models/user_model.dart';
import 'package:starter_app/repository/rest_client.dart';

import '../state.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RestClient restClient;
  UserBloc(
    this.restClient,
  ) : super(UserState()) {
    on<UserEvent>((event, emit) async {
      emit(state.copyWith(
        status: DataStateStatus.loading,
      ));

      try {
        final ResponseApi responseApi = await restClient.getUsers();
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
