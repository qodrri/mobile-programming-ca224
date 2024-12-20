import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repositories/comment_repository.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;

  CommentBloc(this.repository) : super(CommentInitial()) {
    on<LoadComments>((event, emit) async {
      emit(CommentLoading());
      try {
        final comments = await repository.fetchComments(event.momentId);
        emit(CommentLoaded(comments));
      } catch (e) {
        emit(CommentError(e.toString()));
      }
    });

    on<AddComment>((event, emit) async {
      if (state is CommentLoaded) {
        final currentComments = (state as CommentLoaded).comments;
        try {
          await repository.addComment(event.momentId, event.comment);
          emit(CommentLoaded([
            ...currentComments,
            event.comment
          ])); // Tambahkan ke List<Comment>
        } catch (e) {
          emit(CommentError(e.toString()));
        }
      }
    });
  }
}
