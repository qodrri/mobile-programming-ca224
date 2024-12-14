part of 'moment_bloc.dart';

sealed class MomentEvent extends Equatable {
  const MomentEvent();

  @override
  List<Object> get props => [];
}

final class MomentGetEvent extends MomentEvent {}

final class MomentGetByIdEvent extends MomentEvent {
  final String momentId;
  const MomentGetByIdEvent(this.momentId);
}

final class MomentAddEvent extends MomentEvent {
  final Moment newMoment;
  const MomentAddEvent(this.newMoment);
}

final class MomentUpdateEvent extends MomentEvent {
  final Moment updatedMoment;
  const MomentUpdateEvent(this.updatedMoment);
}

final class MomentDeleteEvent extends MomentEvent {
  final String momentId;
  const MomentDeleteEvent(this.momentId);
}

final class MomentNavigateToAddEvent extends MomentEvent {}

final class MomentNavigateToUpdateEvent extends MomentEvent {
  final String momentId;
  const MomentNavigateToUpdateEvent(this.momentId);
}

final class MomentNavigateToDeleteEvent extends MomentEvent {
  final String momentId;
  const MomentNavigateToDeleteEvent(this.momentId);
}

class MomentNavigateBackEvent extends MomentEvent {}