import 'package:church/viewModels/eventsListViewModel.dart';
import 'package:church/viewModels/eventsViewModel.dart';
import 'package:church/widgets/eventsTabs.dart';
import 'package:church/ui/eventsPageBackground.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {

  @override
  void initState() {
    super.initState();
    Provider.of<EventsListViewModel>(context, listen: false).newsHeadlines();
  }

  List<EventsViewModel> filteredEvents = EventsTabs().events;


  Widget _buildList(EventsListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: EventsTabs(
            events: vs.events,
          ),
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<EventsListViewModel>(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget> [
          EventsPageBackground(screenHeight: screenHeight),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight*0.045),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Events',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            Divider(
              color: Colors.white70,
              thickness: 4,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Events Listing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
            Expanded(
              child: _buildList(vs),
            ),
          ],
        ),
      ]
      ),
    );
  }
}
