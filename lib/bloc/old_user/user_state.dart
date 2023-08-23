part of 'user_bloc.dart';

class OldUserState {
  final DataStateStatus status;
  final List<UserModel>? users;
  final String errorMessage;

  OldUserState({
    this.status = DataStateStatus.initial,
    this.users,
    this.errorMessage = "",
  });

  OldUserState copyWith({
    DataStateStatus? status,
    List<UserModel>? users,
    String? errorMessage,
  }) {
    return OldUserState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
