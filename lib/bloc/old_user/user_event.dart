part of 'user_bloc.dart';

sealed class OldUserEvent extends Equatable {
  const OldUserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends OldUserEvent {}
