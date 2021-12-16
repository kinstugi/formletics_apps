import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageInputAndSender extends StatefulWidget {
  final WebSocketChannel channel;

  const MessageInputAndSender({this.channel});

  @override
  _MessageInputAndSenderState createState() => _MessageInputAndSenderState();
}

class _MessageInputAndSenderState extends State<MessageInputAndSender> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'enter message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                widget.channel.sink.add(
                  jsonEncode({
                    'message': _controller.text,
                    'command': 'new_message',
                  }),
                );
                _controller.clear();
              }
            },
          )
        ],
      ),
    );
  }
}
