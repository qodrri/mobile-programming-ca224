import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/resources/colors.dart';
import '../../../models/comment.dart';
import 'package:myapp/views/comment/bloc/comment_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_event.dart';
import 'package:myapp/views/comment/bloc/comment_state.dart';

class CommentEntryPage extends StatefulWidget {
  static const routeName = '/comment/entry';
  const CommentEntryPage({super.key, this.commentId});
  final String? commentId;

  @override
  State<CommentEntryPage> createState() => _CommentEntryPageState();
}

class _CommentEntryPageState extends State<CommentEntryPage> {
  // Membuat object form global key
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _creatorController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  // Membuat method untuk menyimpan data komentar
  void _saveComment() {
    if (_formKey.currentState!.validate()) {
      final newComment = Comment(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // Gunakan ID unik
        creator: _creatorController.text,
        content: _commentController.text,
        createdAt: DateTime.now(),
        momentId: widget.commentId ?? "", // Menambahkan momentId
      );

      // Kirim event AddComment ke BLoC
      context
          .read<CommentBloc>()
          .add(AddComment(widget.commentId ?? "", newComment));

      // Menutup halaman setelah komentar ditambahkan
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Creator'),
                TextFormField(
                  controller: _creatorController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Moment creator',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment creator';
                    }
                    return null;
                  },
                ),
                const Text('Comment'),
                TextFormField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Comment description',
                    prefixIcon: const Icon(Icons.note),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter comment caption';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: largeSize),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: _saveComment,
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(height: mediumSize),
                SizedBox(
                  height: 50.0,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
