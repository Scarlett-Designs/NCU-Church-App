import 'package:church/data/models/eventsModel.dart';
import 'package:church/services/eventsWebService.dart';
import 'package:church/viewModels/eventsViewModel.dart';
import 'package:flutter/material.dart';


enum LoadingStatus {
  completed,
  searching,
  empty,
}

class EventsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<EventsViewModel> events = List<EventsViewModel>();


  void newsHeadlines() async {
    List<Events> event = await EventsWebService().fetchEvents();

    notifyListeners();

    this.events = event
        .map((event) => EventsViewModel(event: event))
        .toList();

    if (this.events.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();

  }
}
