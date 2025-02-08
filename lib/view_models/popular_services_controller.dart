import 'package:get/get.dart';

class PopularServicesController extends GetxController {
  // بيانات الخدمات الشهيرة
  var services = [
    {
      "id": 1,
      "name": "House Cleaning",
      "price": 25,
      "rating": 4.8,
      "reviews": 8289,
      "image": "assets/images/image_home1.png",
    },
    {
      "id": 2,
      "name": "Floor Cleaning",
      "price": 20,
      "rating": 4.5,
      "reviews": 6453,
      "image": "assets/images/image_home2.png",
    },
    {
      "id": 3,
      "name": "Washing Clothes",
      "price": 22,
      "rating": 4.7,
      "reviews": 7038,
      "image": "assets/images/image_home3.png",
    },
    {
      "id": 4,
      "name": "Bathroom Cleaning",
      "price": 24,
      "rating": 4.6,
      "reviews": 5921,
      "image": "assets/images/image_home4.png",
    },
  ].obs;

  var bookmarkedServices = [].obs;

  void toggleBookmark(int id) {
    if (bookmarkedServices.contains(id)) {
      bookmarkedServices.remove(id);
    } else {
      bookmarkedServices.add(id);
    }
  }

  bool isBookmarked(int id) {
    return bookmarkedServices.contains(id);
  }
}
