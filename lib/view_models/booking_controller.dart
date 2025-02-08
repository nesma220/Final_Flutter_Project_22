import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var roomCounts = {
    'Living Room': 1,
    'Terrace': 0,
    'Bedroom': 4,
    'Bathroom': 2,
    'Kitchen': 1,
    'Dining Room': 0,
    'Garage': 0,
  }.obs;

  var selectedDate = DateTime.now().obs;
  var workingHours = 0.obs;
  var startTime = ''.obs;
  var addressController = TextEditingController();
  var selectedPaymentMethod = ''.obs;
  var paymentMethods = {
    'PayPal': false,
    'Google Pay': false,
    'Apple Pay': false,
    'Cash Money': false,
  }.obs;
  var category = 'House Cleaning'.obs;

  double calculateTotalCost() {
    double baseCost = 25.0;
    int totalRooms = roomCounts.values.reduce((a, b) => a + b);
    return baseCost * totalRooms;
  }

  void incrementRoom(String room) {
    roomCounts[room] = (roomCounts[room]! + 1);
    roomCounts.refresh();
  }

  void decrementRoom(String room) {
    if (roomCounts[room]! > 0) {
      roomCounts[room] = (roomCounts[room]! - 1);
      roomCounts.refresh();
    }
  }
}
