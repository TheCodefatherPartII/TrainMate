import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  Bubble(
      {this.message, this.time, this.delivered, this.isMe, this.isBroadcast});

  final String message, time;
  final delivered, isMe;
  final bool isBroadcast;

  @override
  Widget build(BuildContext context) {
    final bg = isBroadcast
        ? Color.lerp(Theme.of(context).primaryColor, Colors.white, 0.25)
        : (isMe ? Colors.white : Colors.greenAccent.shade100);
    final align = isBroadcast
        ? CrossAxisAlignment.stretch
        : isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final icon = delivered ? Icons.done_all : Icons.done;
    final textColour = isBroadcast ? Colors.white : Colors.black54;
    final metaTextColour =
        isBroadcast ? Colors.white.withOpacity(0.75) : Colors.black38;
    final borderColour = isBroadcast
        ? Theme.of(context).primaryColor
        : (isMe ? Colors.black38 : Colors.greenAccent.shade700);

    final radius = isBroadcast
        ? BorderRadius.circular(10.0)
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
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: borderColour),
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Row(children: <Widget>[
                  isBroadcast
                      ? Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        )
                      : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(message,
                          style: TextStyle(
                            color: textColour,
                            fontSize: 15.0,
                          )),
                    ),
                  )
                ]),
              ),
              Positioned(
                top: -2.0,
                right: 0.0,
                child: Text(time,
                    style: TextStyle(
                      color: metaTextColour,
                      fontSize: 10.0,
                    )),
              ),
              Positioned(
                top: 8.0,
                right: 0.0,
                child: Icon(
                  icon,
                  size: 12.0,
                  color: metaTextColour,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
