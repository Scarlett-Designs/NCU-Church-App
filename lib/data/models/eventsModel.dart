class Events {
  final String status;
  final String summary;
  final String description;
  final String start;
  final String end;
  final String location;

  Events({
    this.status,
    this.summary,
    this.description,
    this.start,
    this.end,
    this.location,
  });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
        status: json['status'],
        summary: json['summary'],
        description: json['description'],
        start: json['start']['dateTime'],
        end: json['end']['dateTime'],
        location: json['location']);
  }
}
