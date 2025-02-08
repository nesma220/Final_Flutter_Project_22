import 'package:get/get.dart';

class NotificationController extends GetxController {
  // بيانات الإشعارات
  final List<Map<String, dynamic>> notifications = [
    {
      'date': 'Today',
      'items': [
        {
          'title': 'Payment Successful!',
          'description': 'You have made a services payment',
          'color': 0xFF9A6AFF, // لون الدائرة
          'icon': '💳',
        },
        {
          'title': 'New Category Services!',
          'description': 'Now the plumbing service is available',
          'color': 0xFFFF6666,
          'icon': '🛠️',
        },
      ]
    },
    {
      'date': 'Yesterday',
      'items': [
        {
          'title': "Today's Special Offers",
          'description': 'You get a special promo today!',
          'color': 0xFFFFD166,
          'icon': '⭐',
        },
      ]
    },
    {
      'date': 'December 22, 2024',
      'items': [
        {
          'title': 'Credit Card Connected!',
          'description': 'Credit Card has been linked!',
          'color': 0xFF9A6AFF,
          'icon': '💳',
        },
        {
          'title': 'Account Setup Successful!',
          'description': 'Your account has been created',
          'color': 0xFF66DDAA,
          'icon': '✅',
        },
      ]
    },
  ];
}
