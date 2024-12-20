import 'package:equatable/equatable.dart';
import 'package:myapp/models/comment.dart';

abstract class CommentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CommentLoading extends CommentState {}

class CommentInitial extends CommentState {}


class CommentLoaded extends CommentState {
  final List<Comment> comments;

  CommentLoaded(this.comments);

  @override
  List<Object?> get props => [comments];
}

class CommentError extends CommentState {
  final String error;

  CommentError(this.error);

  @override
  List<Object?> get props => [error];
}
