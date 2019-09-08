import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  Bubble(
      {this.message, this.time, this.delivered, this.isMe, this.isBroadcast});

  final String message, time;
  final delivered, isMe;
  final bool isBroadcast;

  @override
  Widget build(BuildContext context) {
    final bg = isBroadcast ? Theme.of(context).primaryColor : (isMe ? Colors.white : Colors.greenAccent.shade100);
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final icon = delivered ? Icons.done_all : Icons.done;
    final textColor = isBroadcast ? Colors.white : Colors.black38;

    final radius = isBroadcast
        ? BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(10.0))
        : (isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(10.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(5.0),
              ));

    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message, style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                )),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}