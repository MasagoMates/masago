import 'Restaurant.dart';
import 'package:http/http.dart' as http;


class RestaurantJSON {
  final String formatted_address;
  final String name;
  final int price_level;
  final double rating;

  Post({this.formatted_address, this.name, this.price_level, this.rating});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      formatted_address: json['formatted_address'],
      name: json['name'],
      price_level: json['price_level'],
      rating: json['rating'].toDouble(),
    );
  }

 String getAddress(){
    return formatted_address;
 }

 String getName(){
    return name;
 }

 int getPriceLevel(){
    return price_level;
 }

 double getRating(){
    return rating;
 }

}