part of 'user_bloc.dart';

class UserState {
  final DataStateStatus status;
  final List<UserModel>? users;
  final String errorMessage;

  UserState({
    this.status = DataStateStatus.initial,
    this.users,
    this.errorMessage = "",
  });

  UserState copyWith({
    DataStateStatus? status,
    List<UserModel>? users,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
