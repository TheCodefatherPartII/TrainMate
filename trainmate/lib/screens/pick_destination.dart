import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trainmate/api.dart';
import 'package:trainmate/models/models.dart';


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

    getTripDetails();
  }

  void getTripDetails() async {
    final res = await getTrip(widget.carriageId);

    Future.delayed(const Duration(seconds: 1), ()
    {
      setState(() {
        loading = false;
        trip = res;
      });
    });
  }

  _goToChatPage(stop) async {
    Navigator.of(context)
        .pushNamed(
        '/chat', arguments: {'destination': stop, 'title': this.trip.routeName, 'trip': this.trip});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return loadingPage();
    }

    final Widget svg = new SvgPicture.asset('images/train_logo.svg', width: 20, height: 20);

    return Scaffold(
        appBar: AppBar(
          title: Text('Select Destination'),
        ),
        body: Center(
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: trip.stops.map((stop) =>
             ListTile(
               onTap: () => _goToChatPage(stop),
            leading: svg,
            title: Text(stop.name.replaceAll(new RegExp(r" station$", caseSensitive: false), ""), style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(stop.arrivalTime.difference(DateTime.now()).inMinutes.toString() + "m away", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
             ),
            ).toList()
            ).toList()
          ),
        ));
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
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
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
