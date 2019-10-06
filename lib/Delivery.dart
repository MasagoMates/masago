import 'Restaurant.dart';

class Delivery {
  String deliveryOptionName;
  Restaurant restaurantOption;
  double estimatedDeliveryPrice;
  double deliveryTime;


  /*
  <summary> The Delivery constructor that takes in a multitude of inputs. </summary>

  <param name="_deliveryOptionName">the name of the delivery service (ex: UberEats, DoorDash, etc.)</param>
  <param name="_restaurant">the name of the restaurant that has the delivery service.. (ex: McDonald's) </param>
  <param name="_deliveryPrice">the estimated cost to get the food delivered</param>
  <param name="_deliveryTime">the estimated time it will take for a delivery</param>
   */
Delivery(String _deliveryOptionName, Restaurant _restaurantOption, double _deliveryPrice, double _deliveryTime) {
  deliveryOptionName = _deliveryOptionName;
  restaurantOption = _restaurantOption;
  estimatedDeliveryPrice = _deliveryPrice;
  deliveryTime = _deliveryTime;
}










}