import 'package:church/data/models/eventsModel.dart';
import 'package:church/res/constants.dart';
import 'package:dio/dio.dart';


class EventsWebService {
  var dio = new Dio();

  Future<List<Events>> fetchEvents() async {
    String url = Constants.EventsURL;

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['items'];
      return list.map((event) => Events.fromJson(event)).toList();
    } else {
      throw Exception("Failed to retrieve Events list");
    }
  }
}
