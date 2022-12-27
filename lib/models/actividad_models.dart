class Activity {
  String activity;
  String type;
  String link;
  int participants;
  double price;

  Activity({
    required this.activity,
    required this.type,
    required this.link,
    required this.participants,
    required this.price,
  });

  factory Activity.fromJson(Map<String, dynamic> activity) {
    return Activity(
      activity: activity['activity'] ?? '',
      type: activity['type'] ?? '',
      link: activity['link'] ?? '',
      participants: activity['participants'] ?? 0,
      price: double.parse(activity['price'].toString()),
    );
  }
}
