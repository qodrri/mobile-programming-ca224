part of 'moment_bloc.dart';

sealed class MomentState extends Equatable {
  const MomentState();

  @override
  List<Object> get props => [];
}

// Referensi loading untuk CRUD
final class MomentLoadingState extends MomentState {}

// Referensi action state
final class MomentActionState extends MomentState {
  const MomentActionState();
}

// State untuk action get
final class MomentGetLoadingState extends MomentLoadingState {}

final class MomentGetSuccessState extends MomentState {
  final List<Moment> moments;
  const MomentGetSuccessState(this.moments);
}

final class MomentGetFailedActionState extends MomentActionState {
  final String error;
  const MomentGetFailedActionState(this.error);
}

// State untuk action get by id
final class MomentGetByIdLoadingState extends MomentLoadingState {}

final class MomentGetByIdSuccessActionState extends MomentActionState {
  final Moment moment;
  const MomentGetByIdSuccessActionState(this.moment);
}

final class MomentGetByIdFailedActionState extends MomentActionState {
  final String error;
  const MomentGetByIdFailedActionState(this.error);
}

// State untuk action add
final class MomentAddLoadingState extends MomentLoadingState {}

final class MomentAddSuccessActionState extends MomentActionState {
  final Moment moment;
  const MomentAddSuccessActionState(this.moment);
}

final class MomentAddFailedActionState extends MomentActionState {
  final String error;
  const MomentAddFailedActionState(this.error);
}

// State untuk action update
final class MomentUpdateLoadingState extends MomentLoadingState {}

final class MomentUpdateSuccessActionState extends MomentActionState {
  final Moment moment;
  const MomentUpdateSuccessActionState(this.moment);
}

final class MomentUpdateFailedActionState extends MomentActionState {
  final String error;
  const MomentUpdateFailedActionState(this.error);
}

// State untuk action delete
final class MomentDeleteLoadingState extends MomentLoadingState {}

final class MomentDeleteSuccessActionState extends MomentActionState {
  final String momentId;
  const MomentDeleteSuccessActionState(this.momentId);
}

final class MomentDeleteFailedActionState extends MomentActionState {
  final String error;
  const MomentDeleteFailedActionState(this.error);
}

// State untuk navigasi
final class MomentNavigateToAddActionState extends MomentActionState {}

final class MomentNavigateToUpdateActionState extends MomentActionState {
  final String momentId;
  const MomentNavigateToUpdateActionState(this.momentId);
}

final class MomentNavigateToDeleteActionState extends MomentActionState {
  final String momentId;
  const MomentNavigateToDeleteActionState(this.momentId);
}

final class MomentNavigateBackActionState extends MomentActionState {}
