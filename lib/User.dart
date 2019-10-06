import 'dart:collection';
import 'package:masago/Restaurant.dart';
import 'Card.dart';

class User{
  double totalPriceRatings;
  double totalDistance;
  HashMap<String, int> cusinePreference;
  int transactions;
  int totalSwipeRights;


  /*
  <Summary> The constructor for the user. Initially, the user has no data. </Summary>
   */
  User(){
    totalPriceRatings = 0;
    totalDistance = 0;
    cusinePreference = new HashMap<String, int>();
    transactions = 0;
    totalSwipeRights = 0;
  }

  /*
  When the user swipes right on a card, the type of cusine that the food they selected is recorded.
   */
  void swipedRight(Card cardChosenByUser, ){
    cusinePreference[cardChosenByUser.cusineType] += 1;
    totalSwipeRights++;
  }

  /*
  When a user selects the restaurant, data about the restaurant is collected such as how pricey and far it is
   */
  void pickedRestaurant(Restaurant restaurantChosenByUser)
  {
    totalPriceRatings += restaurantChosenByUser.priceLevel;
    totalDistance += restaurantChosenByUser.distance;
    transactions++;
  }

  /*
  A simple calculator to calculate the average distance restaurants are from the user when they are selected.
   */
  double calculateAverageDistance() {
    if(transactions == 0) {
        return 0;
      }else{
      return totalDistance/transactions;
    }
  }

  /*
  A simple calculator to calculate the average priceyness of a restaurant that a user selects
   */
  double calculateAveragePriceRating(){
    if(transactions == 0){
      return 0;
      }else{
      return totalPriceRatings/transactions;
    }
  }


}