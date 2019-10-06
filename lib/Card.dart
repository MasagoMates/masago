import 'Restaurant.dart';
import 'Delivery.dart';

class Card {
  String image;     //PLEASE CHANGE THIS LATER DOWN THE LINE... IMAGES ARENT STRINGS.. I REPEAT.. IMAGES ARENT STRINGS
  String description;
  List<Restaurant> restaurants;
  List<Delivery> deliveryOptions;
  String cusineType;

  /*
  Food object constructor.

    <param name="imageFilename">the filename of the image of the food</param>
    <param name="_description">a short description of the food</param>
    <param name="_restaurants">the restaurants that serve the type of food</param>
    <param name="_deliveryOptions">the delivery options that will deliver the food to the user</param>
    <param name="_cusineType">the type of cusine </param>
   */
  Card(String imageFilename, String _description, List<Restaurant> _restaurants, List<Delivery> _deliveryOptions, String _cusineType)
  {
    image = imageFilename;
    description = _description;
    _restaurants.forEach((element) => restaurants.add(element));
    _deliveryOptions.forEach((element) => deliveryOptions.add(element));
    cusineType = _cusineType;
  }

  void addRestaurant(Restaurant restaurant){
    restaurants.add(restaurant);
  }

  void addDelivery(Delivery delivery){
    deliveryOptions.add(delivery);
  }

  /*
  Creates a card and adds it into the Queue of cards
   */
  void createCard(String foodName, Restaurant restaurant)
  {
    String imageFilename = foodName + ".jpg";

    List<Restaurant> restaurants = new List<Restaurant>();
    restaurants.add(restaurant);


    Delivery deliveryOption1 = new Delivery("UberEats", "UberEats.jpg", restaurant, 3.00 , 10);
    Delivery deliveryOption2 = new Delivery("GrubHub", "GrubHub.jpg", restaurant, 6.00 , 5);
    List<Delivery> deliveryOptions = new List<Delivery>();
    deliveryOptions.add(deliveryOption1);

    String cusineType = getCusineType(foodName);

    Card currentCard = new Card(imageFilename, foodName, restaurants, deliveryOptions, cusineType);
  }

  String getCusineType(String foodName) {
    switch(foodName){
      case "burgers":
        {
          return "American";
        }
        break;

      case "pizza":
        {
          return "Italian";
        }
        break;

      case "sushi":
        {
          return "Japanese";
        }
        break;

      case "ramen":
        {
          return "Japanese";
        }
        break;

      case "italian food":
        {
          return "Italian";
        }
        break;

      case "pasta":
        {
          return "Italian";
        }
        break;

      case "salad":
        {
          return "American";
        }
        break;

      case "sandwich":
        {
          return "American";
        }
        break;

      case "American BBQ":
        {
          return "American";
        }
        break;

      case "pho":
        {
          return "Vietnamese";
        }
        break;

      case "tacos":
        {
          return "Mexican";
        }
        break;

      case "ice cream":
        {
          return "American";
        }
        break;

      case "dumplings":
        {
          return "Chinese";
        }
        break;

      case "chinese food":
        {
          return "Chinese";
        }
        break;

      case "bread":
        {
          return "American";
        }
        break;

      case "steak":
        {
          return "American";
        }
        break;

      case "fried chicken":
        {
          return "American";
        }
        break;

      case "lobster":
        {
          return "American";
        }
        break;

      case "milkshake":
        {
          return "American";
        }
        break;

      case "smoothie":
        {
          return "American";
        }
        break;

      case "burrito":
        {
          return "Mexican";
        }
        break;

      case "coffee":
        {
          return "American";
        }
        break;

      default:
        {
          return "American";
        }
        break;
    }
  }

}