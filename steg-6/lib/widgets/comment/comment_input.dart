import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/comment.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';

class CommentInput extends StatefulWidget {
  final void Function(Comment comment) addComment;
  const CommentInput({
    required this.addComment,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _controller = TextEditingController();
  var _message = '';
  var loading = false;

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    if (_message.isEmpty) {
      return;
    }

    setState(() {
      loading = true;
    });
    final newComment = Comment.toCreate(_message);
    widget.addComment(newComment);
    setState(() {
      _message = '';
    });
    _controller.clear();

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: _controller,
        minLines: 3,
        maxLines: 6,
        onChanged: (value) => setState(() => _message = value),
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        autocorrect: false,
        onSubmitted: (String? value) => _sendMessage(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
          hintText: 'Skriv en kommentar',
          suffix: ChipButton(
            loading: loading,
            label: 'Legg til',
            onClick: _message.isNotEmpty ? _sendMessage : null,
          ),
        ),
      ),
    );
  }
}
