part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success({@Default([]) List<UserModel> users}) = _Success;
  const factory UserState.error({@Default("") String errorMessage}) = _Error;
}
