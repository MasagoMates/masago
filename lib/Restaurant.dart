import 'package:masago/RestaurantJSON.dart';
class Restaurant {
  String restaurantName;
  String restaurantAddress;
  double rating;
  int priceLevel;
  double distance;

  /*<summary>
  Restaurant constructor that takes in all of the basic information that is needed.
  </summary>
  <param name="_restaurantName">the name of the restaurant</param>
  <param name="_rating">the rating of the restaurant (out of 5 stars.. based on Yelp/Google Maps)</param>
  <param name="_priceRating">the price rating of the restaurant (out of 4 '$'.. just like Yelp or Google Maps)</param>
  <param name="_distance">the distance of the restaurant from the user</param>
  <param name="_meals">the meals that the restaurant serves</param>
  <param name="_authentic">the name of the restaurant</param>
   */
  Restaurant(String _restaurantName, String _restaurantAddress, double _rating, int _priceRating,
      double _distance) {
    restaurantName = _restaurantName;
    restaurantAddress = _restaurantAddress;
    if (_rating > 0 && _rating < 6) {   //checks if the rating is valid kind of redundant since the user isn't putting in the inputs
      rating = _rating;
    }
    if (_priceRating > 0 && _priceRating < 5) {   //checks if the rating is valid kind of redundant since the user isn't putting in the inputs
      priceLevel = _priceRating;
    }
    distance = _distance;
  }

   Restaurant.fromRestaurant (RestaurantJSON input) {
    restaurantName = input.name;
    restaurantAddress = input.formatted_address;
    rating = input.rating;
    priceLevel = input.price_level;
    distance = null;
  }



}
