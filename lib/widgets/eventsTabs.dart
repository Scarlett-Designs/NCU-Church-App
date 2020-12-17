import 'package:church/viewModels/eventsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class EventsTabs extends StatefulWidget {
  final List<EventsViewModel> events;

  EventsTabs({this.events});

  @override
  _EventsTabsState createState() => _EventsTabsState();
}

class _EventsTabsState extends State<EventsTabs> {

  List<EventsViewModel> fEvents = List();

  @override
  void initState() {
    fEvents = this.widget.events;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight *0.67,
        child: Card(
          color: Colors.white70,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight *0.01,),
                Center(
                  child: Container(
                    color: Color.fromARGB(150,244,196,48),
                    width: screenWidth *0.85,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          fEvents = this.widget.events
                              .where((e) => e.summary.toLowerCase().contains(value.toLowerCase())
                              || e.start.toLowerCase().contains(value.toLowerCase())
                              ||e.location.toLowerCase().contains(value.toLowerCase())).toList();
                        });
                      },
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black),
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search, color: Colors.black,),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight *0.02,),
                Container(
                  height: screenHeight *0.55,
                  child: ListView.builder(
                      itemCount: this.fEvents.length,
                      itemBuilder: (BuildContext _, int index) {
                        final event = this.fEvents[index];
                        String description = event.description;
                        String start = event.start;
                        String status = event.status;
                        String location = event.location;

                        if (description == null) description = 'Currently Unavailable';
                        if (status == 'confirmed')
                          status = 'Event Confirmed';
                        else
                          status = "Event Unconfirmed";

                        return Card(
                          child: ListTile(
                            title: Text(event.summary ?? 'Not available'),
                            subtitle: Text('\nStatus: $status \nDate: $start'),
                            trailing: GFButton(
                              color: Color.fromRGBO(0, 71, 139, .75),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            contentPadding:
                                                EdgeInsets.only(left: 20, right: 20),
                                            title: Center(child: Text(event.summary)),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            content: Container(
                                              height: 200,
                                              width: 300,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.stretch,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: screenHeight *0.02,
                                                    ),
                                                    Text('\nStatus: $status'),
                                                    Text('Description: $description \n'),
                                                    Text('Start: $start'),
                                                    Text('\nLocation: $location')
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: screenWidth * 0.20,
                                                    child: GFButton(
                                                      color: Colors.red,
                                                      child: new Text(
                                                        'Close',
                                                        style:
                                                            TextStyle(color: Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ]);
                                      });
                                },
                                text: "Learn More"),
                            isThreeLine: true,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
