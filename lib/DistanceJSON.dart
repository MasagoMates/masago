//Post Class inspired from https://flutter.dev/docs/cookbook/networking/fetch-data
import 'package:http/http.dart' as http;


class DistanceJSON {
  final List<Future<DistanceJSON>> rows;

  DistanceJSON({this.rows});

  factory DistanceJSON.fromJson(Map<String, dynamic> json) {
    return DistanceJSON(
      rows: json['rows'],
    );
  }
}