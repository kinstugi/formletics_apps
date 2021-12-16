import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessageChatBubble extends StatelessWidget {
  final String message;
  final String username;
  final DateTime date;
  final bool isMe;

  const MessageChatBubble({
    this.date,
    this.message = "hello world",
    this.username,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    final double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final double px = 1 / pixelRatio;

    final BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: const BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );

    final BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: const Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: const BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    final hourString = date.hour < 10 ? "0${date.hour}" : "${date.hour}";
    final minString = date.minute < 10 ? "0${date.minute}" : "${date.minute}";
    final timeString = "$hourString:$minString";

    if (isMe) {
      return Bubble(
        style: styleMe,
        nip: BubbleNip.rightTop,
        nipRadius: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              timeString,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 8,
              ),
            )
          ],
        ),
      );
    }

    return Bubble(
      style: styleSomebody,
      margin: const BubbleEdges.only(top: 10),
      nip: BubbleNip.leftTop,
      nipRadius: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            timeString,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
