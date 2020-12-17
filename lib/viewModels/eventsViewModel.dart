import 'package:church/data/models/eventsModel.dart';
import 'package:intl/intl.dart';

class EventsViewModel {
  Events _events;

  EventsViewModel({Events event}) : _events = event;

  String get status {
    return _events.status;
  }

  String get summary {
    return _events.summary;
  }

  String get description {
    return _events.description;
  }

  String get location {
    return _events.location;
  }

  String get start {
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_events.start, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }

  String get end {
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_events.end, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}