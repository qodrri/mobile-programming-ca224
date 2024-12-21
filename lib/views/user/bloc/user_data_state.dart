part of 'user_data_bloc.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}

final class UserDataLoadingState extends UserDataState {
  const UserDataLoadingState();
}

final class UserDataActionState extends UserDataState {
  const UserDataActionState();
}

final class UserDataFailedActionState extends UserDataActionState {
  final String message;
  const UserDataFailedActionState(this.message);

  @override
  List<Object> get props => [message];
}

final class UserDataGetSuccessState extends UserDataState {
  final List<Moment> moments;
  final List<User> followers;
  final List<User> followings;
  const UserDataGetSuccessState(
    this.moments,
    this.followers,
    this.followings,
  );

  @override
  List<Object> get props => [moments, followers, followings];
}

final class UserDataGetMomentLoadingState extends UserDataLoadingState {}

final class UserDataGetMomentSuccessState extends UserDataState {
  final List<Moment> moments;
  const UserDataGetMomentSuccessState(this.moments);

  @override
  List<Object> get props => [moments];
}

final class UserDataGetMomentFailedActionState
    extends UserDataFailedActionState {
  const UserDataGetMomentFailedActionState(super.message);
}

final class UserDataGetFollowerLoadingState extends UserDataLoadingState {}

final class UserDataGetFollowerSuccessState extends UserDataState {
  final List<User> followers;
  const UserDataGetFollowerSuccessState(this.followers);

  @override
  List<Object> get props => [followers];
}

final class UserDataGetFollowerFailedActionState
    extends UserDataFailedActionState {
  const UserDataGetFollowerFailedActionState(super.message);
}

final class UserDataGetFollowingLoadingState extends UserDataLoadingState {}

final class UserDataGetFollowingSuccessState extends UserDataState {
  final List<User> followings;
  const UserDataGetFollowingSuccessState(this.followings);

  @override
  List<Object> get props => [followings];
}

final class UserDataGetFollowingFailedActionState
    extends UserDataFailedActionState {
  const UserDataGetFollowingFailedActionState(super.message);
}

final class UserDataFollowLoadingState extends UserDataLoadingState {
  final String userId;
  const UserDataFollowLoadingState(this.userId);

  @override
  List<Object> get props => [userId];
}

final class UserDataFollowSuccessActionState extends UserDataActionState {
  final String userId;
  const UserDataFollowSuccessActionState(this.userId);

  @override
  List<Object> get props => [userId];
}

final class UserDataFollowFailedActionState extends UserDataFailedActionState {
  const UserDataFollowFailedActionState(super.message);
}

final class UserDataUnfollowLoadingState extends UserDataLoadingState {
  final String userId;
  const UserDataUnfollowLoadingState(this.userId);

  @override
  List<Object> get props => [userId];
}

final class UserDataUnfollowSuccessActionState extends UserDataActionState {
  final String userId;
  const UserDataUnfollowSuccessActionState(this.userId);

  @override
  List<Object> get props => [userId];
}

final class UserDataUnfollowFailedActionState
    extends UserDataFailedActionState {
  const UserDataUnfollowFailedActionState(super.message);
}
