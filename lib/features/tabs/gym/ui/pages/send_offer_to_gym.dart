import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/message_chat_bubble.dart';
import 'package:formletics/features/panels/trainer_panel/ui/widgets/message_input_send.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SendOfferToGym extends StatefulWidget {
  const SendOfferToGym({Key key}) : super(key: key);

  @override
  _SendOfferToGymState createState() => _SendOfferToGymState();
}

class _SendOfferToGymState extends State<SendOfferToGym> {
  WebSocketChannel channel;
  final String _socketBaseUrl = 'wss://25642ef1d828.ngrok.io/ws/chat/room/';
  List<dynamic> _messages = [];

  @override
  void initState() {
    final _chatUrl = "$_socketBaseUrl/";
    print(">>>>>>>>>>>>>>");
    print(_chatUrl);
    channel = IOWebSocketChannel.connect(_chatUrl, headers: {
      "Authorization": 'TOKEN d723ed883d899eecb909b97358ff1dfc7f83a733'
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    channel.sink.add(jsonEncode({
      'command': 'fetch_message',
    }));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ln(context, 'ask_offer')),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: channel.stream,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  final Map<String, dynamic> msg =
                      jsonDecode(snapshot.data as String)
                          as Map<String, dynamic>;

                  if (msg.containsKey('fetched')) {
                    final List<dynamic> data = msg['data'] as List<dynamic>;
                    _messages = data;
                  } else {
                    _addMessageToList(msg);
                  }
                }

                return ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (ctx, i) {
                    final DateTime _date =
                        DateTime.parse(_messages[i]["datetime"] as String);

                    if (_messages[i]["user"] == 'scorlu') {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: MessageChatBubble(
                          message: _messages[i]["message"] as String,
                          isMe: true,
                          date: _date,
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: MessageChatBubble(
                        message: _messages[i]["message"] as String,
                        date: _date,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          MessageInputAndSender(
            channel: channel,
          ),
        ],
      ),
    );
  }

  void _addMessageToList(dynamic msg) {
    final List filtered = _messages.where((element) {
      return element["datetime"] == msg["datetime"];
    }).toList();

    if (filtered.isEmpty) {
      _messages.add(msg);
    }
  }
}
