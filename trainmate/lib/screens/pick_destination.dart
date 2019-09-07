import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trainmate/animation/slide_left_route.dart';
import 'package:trainmate/api.dart';
import 'package:trainmate/models/models.dart';
import 'package:trainmate/screens/chat_page.dart';

class PickDestinationPage extends StatefulWidget {
  final String carriageId;

  PickDestinationPage({Key key, this.carriageId}) : super(key: key);

  @override
  _PickDestinationPageState createState() => _PickDestinationPageState();
}

class _PickDestinationPageState extends State<PickDestinationPage> {
  TripDetails trip;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () async {
      final res = await getTrip(widget.carriageId);
      setState(() {
        loading = false;
        trip = res;
      });
    });
  }

  _goToChatPage(stop) async {
    Navigator.push(context, SlideLeftRoute(page: ChatPage(destination: stop,title: this.trip.routeName, trip: this.trip)));
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return loadingPage();
    }

    final Widget svg =
        SvgPicture.asset('images/train_logo.svg', width: 30, height: 30);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Destination'),
      ),
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: trip.stops
                .map(
                  (stop) => ListTile(
                    onTap: () => _goToChatPage(stop),
                    leading: svg,
                    title: Text(
                        stop.name.replaceAll(
                            RegExp(r" station$", caseSensitive: false), ""),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text(
                        'in ${stop.arrivalTime.difference(DateTime.now()).inMinutes} mins',
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                )
                .toList(),
          ).toList(),
        ),
      ),
    );
  }

  loadingPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Destinations...'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Column(
            children: [0, 1, 2, 3, 4, 5, 6]
                .map((_) => Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            margin: EdgeInsets.only(right: 24),
                          ),
                          Expanded(
                            child: Container(
                              height: 12.0,
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 8),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 12.0,
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 8, left: 64),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
