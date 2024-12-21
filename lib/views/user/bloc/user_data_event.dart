part of 'user_data_bloc.dart';

sealed class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class UserDataGetEvent extends UserDataEvent {
  const UserDataGetEvent();
}

class UserDataGetMomentEvent extends UserDataEvent {
  const UserDataGetMomentEvent();
}

class UserDataGetFollowerEvent extends UserDataEvent {
  const UserDataGetFollowerEvent();
}

class UserDataGetFollowingEvent extends UserDataEvent {
  const UserDataGetFollowingEvent();
}

class UserDataFollowEvent extends UserDataEvent {
  final String userId;
  const UserDataFollowEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class UserDataUnfollowEvent extends UserDataEvent {
  final String userId;
  const UserDataUnfollowEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
