class Restaurant {
  String restaurantName;
  int rating;
  double cost;
  double distance;
  List<String> meals;
  bool authenticFood;

  Restaurant(String closestRestaurantName, int _rating, double _price,
      double _distance, List<String> _meals, bool authentic) {
    restaurantName = closestRestaurantName;
    if (_rating > 0 && _rating < 6) {
      rating = _rating;
    }
    cost = _price;
    distance = _distance;
    _meals.forEach((element) => meals.add(element));
    authenticFood = authentic;
  }
}
