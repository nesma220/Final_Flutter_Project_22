import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  var selectedCategory = 'All'.obs;

  final categories = [
    'All',
    'Cleaning',
    'Repairing',
    'Painting',
    'Laundry',
    'Appliance',
    'Plumbing',
    'Shifting',
    'Beauty',
    'AC Repa.',
    'Vehicle',
    'Electronics',
    'Massage',
    "Men's Sal."
  ];

  var services = [
    // Cleaning
    {
      'id': 1,
      'name': 'House Cleaning',
      'price': '24',
      'rating': '4.8',
      'reviews': 829,
      'image': 'assets/images/house_cleaning.jpeg',
      'description':
          'A thorough and efficient cleaning service tailored to your home’s specific needs, ensuring a spotless and comfortable living environment.',
      'category': 'Cleaning',
      'gallery': [
        'assets/images/services/cleaning_1.jpeg',
        'assets/images/services/cleaning_2.jpeg',
        'assets/images/services/cleaning_3.jpeg',
      ],
      'userReviews': [
        {
          'username': 'Maryland Winkles',
          'comment': 'Awesome! this is what I was looking for.',
          'rating': 5,
        },
        {
          'username': 'Charlotte Hanlin',
          'comment': 'The results were amazing!',
          'rating': 4,
        },
      ],
      'ratingBreakdown': {
        '5-stars': 500,
        '4-stars': 90,
        '3-stars': 10,
        '2-stars': 7,
        '1-star': 3,
      }
    },
    {
      'id': 2,
      'name': 'Office Cleaning',
      'price': '30',
      'rating': '4.7',
      'reviews': 829,
      'image': 'assets/images/house_cleaning.jpeg',
      'description':
          'Professional office cleaning to maintain a tidy, hygienic, and productive workspace. We clean your office to the highest standards.',
      'category': 'Cleaning',
      'userReviews': [
        {
          'username': 'Maryland Winkles',
          'comment': 'Awesome! this is what I was looking for.',
          'rating': 5,
        },
        {
          'username': 'Charlotte Hanlin',
          'comment': 'The results were amazing!',
          'rating': 5,
        },
      ],
      'gallery': [
        'assets/images/services/cleaning_1.jpeg',
        'assets/images/services/cleaning_2.jpeg',
        'assets/images/services/cleaning_3.jpeg'
      ],
      'ratingBreakdown': {
        '5-stars': 500,
        '4-stars': 90,
        '3-stars': 10,
        '2-stars': 7,
        '1-star': 3,
      }
    },
    {
      'id': 3,
      'name': 'Window Cleaning',
      'price': '18',
      'rating': '4.5',
      'reviews': 829,
      'image': 'assets/images/house_cleaning.jpeg',
      'description':
          'Expert window cleaning that enhances your view and brightens your space. We clean both the interior and exterior for streak-free results.',
      'category': 'Cleaning',
      'gallery': [
        'assets/images/services/cleaning_1.jpeg',
        'assets/images/services/cleaning_2.jpeg',
        'assets/images/services/cleaning_3.jpeg'
      ],
      'userReviews': [
        {
          'username': 'Maryland Winkles',
          'comment': 'Awesome! this is what I was looking for.',
          'rating': 5,
        },
        {
          'username': 'Charlotte Hanlin',
          'comment': 'The results were amazing!',
          'rating': 5,
        },
      ],
      'ratingBreakdown': {
        '5-stars': 500,
        '4-stars': 90,
        '3-stars': 10,
        '2-stars': 7,
        '1-star': 3,
      }
    },

    // Repairing
    {
      'id': 4,
      'name': 'Car Repairing',
      'price': '50',
      'rating': '4.9',
      'reviews': 1203,
      'image': 'assets/images/motorcycle_repairing.jpeg',
      'description':
          'Get your vehicle back in top condition with our car repair services, handling everything from engine issues to minor repairs.',
      'category': 'Repairing',
      'gallery': [
        'assets/images/services/Repairing_1.jpeg',
        'assets/images/services/Repairing_2.jpeg',
        'assets/images/services/Repairing_3.jpeg',
        'assets/images/services/Repairing_4.jpeg',
        'assets/images/services/Repairing_5.jpeg',
        'assets/images/services/Repairing_6.jpeg',
      ],
      'userReviews': [
        {
          'username': 'Maryland Winkles',
          'comment': 'Awesome! this is what I was looking for.',
          'rating': 5,
        },
        {
          'username': 'Charlotte Hanlin',
          'comment': 'The results were amazing!',
          'rating': 5,
        },
      ],
      'ratingBreakdown': {
        '5-stars': 500,
        '4-stars': 90,
        '3-stars': 10,
        '2-stars': 7,
        '1-star': 3,
      }
    },
    {
      'id': 5,
      'name': 'Machine Repairing',
      'price': '70',
      'rating': '4.6',
      'reviews': 789,
      'image': 'assets/images/motorcycle_repairing.jpeg',
      'description':
          'Skilled technicians to repair a variety of machines, ensuring their efficient and long-lasting performance.',
      'category': 'Repairing',
      'gallery': [
        'assets/images/services/Repairing_1.jpeg',
        'assets/images/services/Repairing_2.jpeg',
        'assets/images/services/Repairing_3.jpeg',
        'assets/images/services/Repairing_4.jpeg',
        'assets/images/services/Repairing_5.jpeg',
        'assets/images/services/Repairing_6.jpeg',
      ],
      'userReviews': [
        {
          'username': 'Maryland Winkles',
          'comment': 'Awesome! this is what I was looking for.',
          'rating': 5,
        },
        {
          'username': 'Charlotte Hanlin',
          'comment': 'The results were amazing!',
          'rating': 5,
        },
      ],
      'ratingBreakdown': {
        '5-stars': 500,
        '4-stars': 90,
        '3-stars': 10,
        '2-stars': 7,
        '1-star': 3,
      }
    },

    // Painting
    {
      'id': 6,
      'name': 'Painting House Walls',
      'price': '52',
      'rating': '4.8',
      'reviews': 104,
      'image': 'assets/images/image_home2.jpeg',
      'description':
          'Bring color and life to your home with our professional painting services, ensuring smooth, even coats that last.',
      'category': 'Painting',
      'gallery': [
        'assets/images/services/Painting_1.jpeg',
        'assets/images/services/painting_2.jpeg',
        'assets/images/services/painting_3.jpeg',
        'assets/images/services/painting_4.jpeg',
        'assets/images/services/painting_5.jpeg',
        'assets/images/services/painting_6.jpeg',
      ],
      'userReviews': [
        {
          'username': 'Maryland Winkles',
          'comment': 'Awesome! this is what I was looking for.',
          'rating': 5,
        },
        {
          'username': 'Charlotte Hanlin',
          'comment': 'The results were amazing!',
          'rating': 5,
        },
      ],
    },
    {
      'id': 7,
      'name': 'Painting Office Walls',
      'price': '65',
      'rating': '4.7',
      'reviews': 89,
      'image': 'assets/images/image_home4.jpeg',
      'description':
          'Brighten your office environment with our painting services, offering modern designs and smooth finishes that promote productivity.',
      'category': 'Painting',
      'gallery': [
        'assets/images/services/Painting_1.jpeg',
        'assets/images/services/painting_2.jpeg',
        'assets/images/services/painting_3.jpeg',
        'assets/images/services/painting_4.jpeg',
        'assets/images/services/painting_5.jpeg',
        'assets/images/services/painting_6.jpeg',
      ],
    },

    // Laundry
    {
      'id': 8,
      'name': 'Laundry Services',
      'price': '15',
      'rating': '4.9',
      'reviews': 500,
      'image': 'assets/images/image_home1.jpeg',
      'description':
          'Our laundry service ensures your clothes are clean, fresh, and perfectly folded. We offer fast and convenient pick-up and delivery.',
      'category': 'Laundry',
      'gallery': [
        'assets/images/services/Laundry_1.jpeg',
        'assets/images/services/Laundry_2.jpeg',
        'assets/images/services/Laundry_3.jpeg',
        'assets/images/services/Laundry_4.jpeg',
        'assets/images/services/Laundry_5.jpeg',
        'assets/images/services/Laundry_6.jpeg',
      ],
    },
    {
      'id': 9,
      'name': 'Laundry for Men',
      'price': '20',
      'rating': '4.5',
      'reviews': 300,
      'image': 'assets/images/image_home2.jpeg',
      'description':
          'Specialized laundry service for men’s clothing, ensuring every item is treated with care and precision for a fresh, crisp finish.',
      'category': 'Laundry',
      'gallery': [
        'assets/images/services/Laundry_1.jpeg',
        'assets/images/services/Laundry_2.jpeg',
        'assets/images/services/Laundry_3.jpeg',
        'assets/images/services/Laundry_4.jpeg',
        'assets/images/services/Laundry_5.jpeg',
        'assets/images/services/Laundry_6.jpeg',
      ],
    },

    // Appliance
    {
      'id': 10,
      'name': 'Appliance Repairing',
      'price': '45',
      'rating': '4.8',
      'reviews': 432,
      'image': 'assets/images/ac_repairing.jpeg',
      'description':
          'We fix a wide range of household appliances to restore their optimal function, whether it’s a refrigerator, washing machine, or air conditioner.',
      'category': 'Appliance',
      'gallery': [
        'assets/images/services/Appliance_2.jpeg',
        'assets/images/services/Appliance_3.jpeg',
        'assets/images/services/Appliance_4.jpeg',
        'assets/images/services/Appliance.jpeg',
      ],
    },
    {
      'id': 11,
      'name': 'Install Appliance',
      'price': '60',
      'rating': '4.6',
      'reviews': 321,
      'image': 'assets/images/image_home4.jpeg',
      'description':
          'Professional installation of home appliances with guaranteed safety and correct setup, ensuring your appliances work seamlessly from day one.',
      'category': 'Appliance',
      'gallery': [
        'assets/images/services/Appliance_2.jpeg',
        'assets/images/services/Appliance_3.jpeg',
        'assets/images/services/Appliance_4.jpeg',
        'assets/images/services/Appliance.jpeg',
      ],
    },

    // Plumbing
    {
      'id': 12,
      'name': 'Plumbing Repairing',
      'price': '40',
      'rating': '4.9',
      'reviews': 210,
      'image': 'assets/images/ac_repairing.jpeg',
      'description':
          'Expert plumbing services for repairs, including fixing leaks, unclogging drains, and handling pipe issues to prevent damage and ensure smooth water flow.',
      'category': 'Plumbing',
      'gallery': [
        'assets/images/services/Painting_1.jpeg',
        'assets/images/services/Painting_2.jpeg',
        'assets/images/services/Painting_3.jpeg',
        'assets/images/services/Painting_4.jpeg',
        'assets/images/services/painting_5.jpeg',
        'assets/images/services/painting_6.jpeg',
      ],
    },
    {
      'id': 13,
      'name': 'Plumbing Services',
      'price': '35',
      'rating': '4.7',
      'reviews': 150,
      'image': 'assets/images/image_home1.jpeg',
      'description':
          'Comprehensive plumbing services to meet all your needs, from installation to maintenance, to keep your plumbing system in excellent condition.',
      'category': 'Plumbing',
      'gallery': [
        'assets/images/services/Painting_1.jpeg',
        'assets/images/services/Painting_2.jpeg',
        'assets/images/services/Painting_3.jpeg',
        'assets/images/services/Painting_4.jpeg',
        'assets/images/services/painting_5.jpeg',
        'assets/images/services/painting_6.jpeg',
      ],
    },

    // Shifting
    {
      'id': 14,
      'name': 'Home Shifting',
      'price': '100',
      'rating': '4.8',
      'reviews': 520,
      'image': 'assets/images/image_home2.jpeg',
      'description':
          'Reliable and safe home shifting service with careful handling of your belongings. We ensure a smooth transition to your new home.',
      'category': 'Shifting',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },
    {
      'id': 15,
      'name': 'Office Shifting',
      'price': '120',
      'rating': '4.9',
      'reviews': 450,
      'image': 'assets/images/image_home3.jpeg',
      'description':
          'Professional office shifting services to relocate your business without any downtime. We handle all your office furniture and equipment with care.',
      'category': 'Shifting',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },

    // Beauty
    {
      'id': 16,
      'name': 'Haircut for Women',
      'price': '30',
      'rating': '4.9',
      'reviews': 600,
      'image': 'assets/images/house_cleaning.jpeg',
      'description':
          'A professional haircut service that ensures you leave looking fabulous and feeling confident.',
      'category': 'Beauty',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },
    {
      'id': 17,
      'name': 'Haircut for Men',
      'price': '25',
      'rating': '4.7',
      'reviews': 450,
      'image': 'assets/images/house_cleaning.jpeg',
      'description':
          'Our expert barbers provide a clean, sharp look with a variety of styles to suit your preferences.',
      'category': 'Beauty',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },

    // AC Repair
    {
      'id': 18,
      'name': 'AC Repairing',
      'price': '75',
      'rating': '4.8',
      'reviews': 320,
      'image': 'assets/images/ac_repairing.jpeg',
      'description':
          'Fix your AC quickly with our professional repair services, ensuring a cool and comfortable environment.',
      'category': 'AC Repa.',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },

    // Vehicle
    {
      'id': 19,
      'name': 'Car Wash',
      'price': '20',
      'rating': '4.8',
      'reviews': 500,
      'image': 'assets/images/motorcycle_repairing.jpeg',
      'description':
          'Our car wash service includes a thorough clean, both inside and outside, leaving your car sparkling and refreshed.',
      'category': 'Vehicle',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },

    // Electronics
    {
      'id': 20,
      'name': 'Laptop Repairing',
      'price': '60',
      'rating': '4.7',
      'reviews': 420,
      'image': 'assets/images/image_home2.jpeg',
      'description':
          'Our skilled technicians repair laptops of all brands to ensure they work like new.',
      'category': 'Electronics',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },

    // Massage
    {
      'id': 21,
      'name': 'Full Body Massage',
      'price': '50',
      'rating': '4.9',
      'reviews': 420,
      'image': 'assets/images/image_home1.jpeg',
      'description':
          'Relax and rejuvenate with our full-body massage services, tailored to relieve stress and muscle tension.',
      'category': 'Massage',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },

    // Men's Salon
    {
      'id': 22,
      'name': 'Men’s Haircut',
      'price': '20',
      'rating': '4.8',
      'reviews': 420,
      'image': 'assets/images/house_cleaning.jpeg',
      'description':
          'Precision haircuts for men, designed to give you the perfect look for any occasion.',
      'category': 'Men\'s Sal.',
      'gallery': [
        'assets/images/services/Shifting_1.jpeg',
        'assets/images/services/Shifting_2.jpeg',
        'assets/images/services/Shifting_3.jpeg',
        'assets/images/services/Shifting_4.jpeg',
        'assets/images/services/Shifting_5.jpeg',
      ],
    },
  ].obs;

  var bookmarkedServices = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  void loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedBookmarks = prefs.getStringList('bookmarks') ?? [];
    bookmarkedServices.assignAll(savedBookmarks.map(int.parse).toList());
  }

  void addBookmark(int serviceId) async {
    if (!bookmarkedServices.contains(serviceId)) {
      bookmarkedServices.add(serviceId);
      saveBookmarks();
    }
  }

  void removeService(int id) async {
    bookmarkedServices.remove(id); // Remove only from the list
    saveBookmarks();
  }

  void saveBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'bookmarks', bookmarkedServices.map((e) => e.toString()).toList());
  }
}
