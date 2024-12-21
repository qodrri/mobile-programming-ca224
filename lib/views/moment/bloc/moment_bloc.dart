import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../../../models/moment.dart';
import '../../../repositories/contracts/abs_api_moment_repository.dart';

part 'moment_event.dart';
part 'moment_state.dart';

class MomentBloc extends Bloc<MomentEvent, MomentState> {
  final AbsApiMomentRepository _momentRepository;
  List<Moment> _moments = [];
  MomentBloc(this._momentRepository) : super(MomentLoadingState()) {
    // _moments = List.generate(
    //   2,
    //   (index) => Moment(
    //     id: nanoid(),
    //     momentDate: _faker.date.dateTime(),
    //     creator: _faker.person.name(),
    //     location: _faker.address.city(),
    //     imageUrl: 'https://picsum.photos/800/600?random=$index',
    //     caption: _faker.lorem.sentence(),
    //     likesCount: faker.random.integer(1000),
    //     commentsCount: faker.random.integer(100),
    //     bookmarksCount: faker.random.integer(10),
    //   ),
    // );

    // Deklarasikan event handler
    on<MomentGetEvent>(momentGetEvent);
    on<MomentGetByIdEvent>(momentGetByIdEvent);
    on<MomentAddEvent>(momentAddEvent);
    on<MomentUpdateEvent>(momentUpdateEvent);
    on<MomentDeleteEvent>(momentDeleteEvent);
    on<MomentNavigateToAddEvent>(momentNavigateToAddEvent);
    on<MomentNavigateToUpdateEvent>(momentNavigateToUpdateEvent);
    on<MomentNavigateToDeleteEvent>(momentNavigateToDeleteEvent);
    on<MomentNavigateBackEvent>(momentNavigateBackEvent);
  }

  List<Moment> get moments => _moments;

  Moment? getMomentById(String momentId) {
    return _moments.firstWhereOrNull((moment) => moment.id == momentId);
  }

  FutureOr<void> momentGetEvent(
      MomentGetEvent event, Emitter<MomentState> emit) async {
    emit(MomentGetLoadingState());
    try {
      // Membaca data moment dari database
      _moments = await _momentRepository.getAll();
      emit(MomentGetSuccessState(_moments));
    } catch (e) {
      emit(MomentGetFailedActionState(e.toString()));
    }
  }

  FutureOr<void> momentAddEvent(
      MomentAddEvent event, Emitter<MomentState> emit) async {
    emit(MomentAddLoadingState());
    try {
      final newAddedMoment = await _momentRepository.create(event.newMoment);
      if (newAddedMoment != null) {
        _moments.add(event.newMoment);
        emit(MomentAddSuccessActionState(event.newMoment));
      } else {
        emit(const MomentAddFailedActionState('Failed to add moment.'));
      }
    } catch (e) {
      emit(MomentAddFailedActionState(e.toString()));
    }
  }

  FutureOr<void> momentUpdateEvent(
      MomentUpdateEvent event, Emitter<MomentState> emit) async {
    emit(MomentUpdateLoadingState());
    try {
      final existingMoment = getMomentById(event.updatedMoment.id!);
      if (existingMoment != null) {
        final isUpdated = await _momentRepository.update(event.updatedMoment);
        if (isUpdated) {
          _moments[_moments.indexOf(existingMoment)] = event.updatedMoment;
          emit(MomentUpdateSuccessActionState(event.updatedMoment));
        } else {
          emit(const MomentUpdateFailedActionState('Failed to update moment.'));
        }
      } else {
        emit(const MomentUpdateFailedActionState('Moment not found.'));
      }
    } catch (e) {
      emit(MomentUpdateFailedActionState(e.toString()));
    }
  }

  FutureOr<void> momentDeleteEvent(
      MomentDeleteEvent event, Emitter<MomentState> emit) async {
    emit(MomentDeleteLoadingState());
    try {
      final existingMoment = getMomentById(event.momentId);
      if (existingMoment != null) {
        final isDeleted = await _momentRepository.delete(event.momentId);
        if (isDeleted) {
          _moments.remove(existingMoment);
          emit(MomentDeleteSuccessActionState(event.momentId));
        } else {
          emit(const MomentDeleteFailedActionState('Failed to delete moment.'));
        }
      } else {
        emit(const MomentDeleteFailedActionState('Moment not found.'));
      }
    } catch (e) {
      emit(MomentDeleteFailedActionState(e.toString()));
    }
  }

  FutureOr<void> momentNavigateToAddEvent(
      MomentNavigateToAddEvent event, Emitter<MomentState> emit) {
    emit(MomentNavigateToAddActionState());
  }

  FutureOr<void> momentNavigateToUpdateEvent(
      MomentNavigateToUpdateEvent event, Emitter<MomentState> emit) {
    emit(MomentNavigateToUpdateActionState(event.momentId));
  }

  FutureOr<void> momentNavigateToDeleteEvent(
      MomentNavigateToDeleteEvent event, Emitter<MomentState> emit) {
    emit(MomentNavigateToDeleteActionState(event.momentId));
  }

  FutureOr<void> momentNavigateBackEvent(
      MomentNavigateBackEvent event, Emitter<MomentState> emit) {
    emit(MomentNavigateBackActionState());
  }

  FutureOr<void> momentGetByIdEvent(
      MomentGetByIdEvent event, Emitter<MomentState> emit) async {
    emit(MomentGetByIdLoadingState());
    try {
      final moment = getMomentById(event.momentId);
      if (moment != null) {
        emit(MomentGetByIdSuccessActionState(moment));
      } else {
        emit(const MomentGetByIdFailedActionState('Moment not found.'));
      }
    } catch (e) {
      emit(MomentGetByIdFailedActionState(e.toString()));
    }
  }
}
