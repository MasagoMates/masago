import 'dart:collection';
import 'package:masago/Restaurant.dart';
import 'Food.dart';

class User{
  double totalPrice;
  double totalDistance;
  HashMap<String, int> cusinePreference;
  int transactions;
  int totalSwipeRights;


  User(){
    totalPrice = 0;
    totalDistance = 0;
    cusinePreference = new HashMap<String, int>();
    transactions = 0;
    totalSwipeRights = 0;
  }

  void swipedRight(Food cardChosenByUser, ){
    cusinePreference[cardChosenByUser.cusineType] += 1;
    totalSwipeRights++;
  }

  void pickedRestaurant(Restaurant restaurantChosenByUser)
  {
    totalPrice += restaurantChosenByUser.cost;
    totalDistance += restaurantChosenByUser.distance;
    transactions++;
  }

  double calculateAverageDistance() {
    if(transactions == 0) {
        return 0;
      }else{
      return totalDistance/transactions;
    }
  }

  double calculateAveragePrice(){
    if(transactions == 0){
      return 0;
      }else{
      return totalPrice/transactions;
    }
  }


}