//Post Class inspired from https://flutter.dev/docs/cookbook/networking/fetch-data
import 'package:http/http.dart' as http;


class Post {
  final String next_page_token;
  final List<Future<Post>> results;

  Post({this.next_page_token, this.results});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      next_page_token: json['next_page_token'],
      results: json['results'],
    );
  }
}