import 'package:get/get.dart';

import 'package:flutter/material.dart';

class AllServicesController extends GetxController {
  // قائمة الخدمات مع الأيقونات
  final List<Map<String, dynamic>> services = [
    {'name': 'Cleaning', 'icon': Icons.cleaning_services},
    {'name': 'Repairing', 'icon': Icons.build},
    {'name': 'Painting', 'icon': Icons.brush},
    {'name': 'Laundry', 'icon': Icons.local_laundry_service},
    {'name': 'Appliance', 'icon': Icons.kitchen},
    {'name': 'Plumbing', 'icon': Icons.plumbing},
    {'name': 'Shifting', 'icon': Icons.local_shipping},
    {'name': 'Beauty', 'icon': Icons.face_retouching_natural},
    {'name': 'AC Repa.', 'icon': Icons.ac_unit},
    {'name': 'Vehicle', 'icon': Icons.directions_car},
    {'name': 'Electronics', 'icon': Icons.electrical_services},
    {'name': 'Massage', 'icon': Icons.spa},
    {'name': "Men's Sal.", 'icon': Icons.cut},
  ];
}


   // 'Cleaning',
    // 'Repairing',
    // 'Painting',
    // 'Laundry',
    // 'Appliance',
    // 'Plumbing',
    // 'Shifting'