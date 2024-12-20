import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myapp/views/comment/bloc/comment_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_event.dart';
import 'package:myapp/views/comment/bloc/comment_state.dart';

import 'commment_entry_page.dart';

class CommentPage extends StatefulWidget {
  static const routeName = '/comments';
  const CommentPage({super.key, required this.momentId});
  final String momentId;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final _dateFormat = DateFormat('dd MMM yyyy');

  @override
  void initState() {
    super.initState();
    // Trigger the BLoC to load comments
    context.read<CommentBloc>().add(LoadComments(widget.momentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment'),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommentLoaded) {
            final comments = state.comments;
            return SingleChildScrollView(
              child: Column(
                children: comments
                    .map((comment) => ListTile(
                          title: Text(comment.creator),
                          subtitle: Text(comment.content),
                          leading: const CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://i.pravatar.cc/150'),
                          ),
                          trailing: Text(_dateFormat.format(comment.createdAt)),
                        ))
                    .toList(),
              ),
            );
          } else if (state is CommentError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('No Comments Available.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CommentEntryPage.routeName);
        },
        child: const Icon(Icons.comment),
      ),
    );
  }
}
