import 'package:flutter/material.dart';
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

    Future.delayed(const Duration(seconds: 5), ()
    {
      setState(() {
        loading = false;
        trip = res;
      });

      Navigator.of(context)
          .pushNamed(
          '/chat', arguments: {'title': res?.routeName, 'trip': res});
    });
  }

//  _goToChatPage() async {
//    final trip = await getTrip(_carriageController.text?.trim());
//
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) => ChatPage(title: trip?.routeDescription)),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return loadingPage();
    }


    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Need Help?", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ));
  }

  loadingPage() {
    return Scaffold(
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
