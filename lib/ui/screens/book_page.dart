import 'package:final_project/ui/screens/location_page.dart';
import 'package:final_project/view_models/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicServicePage extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  DynamicServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final serviceName = arguments['name'];
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName ?? 'Service Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView(
                  children: controller.roomCounts.keys.map((room) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(room, style: const TextStyle(fontSize: 18)),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () => controller.decrementRoom(room),
                              ),
                              Text(controller.roomCounts[room].toString(),
                                  style: const TextStyle(fontSize: 18)),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () => controller.incrementRoom(room),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                double totalCost = controller.calculateTotalCost();
                Get.to(() => BookingDetailsPage(), arguments: totalCost);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Obx(() => Text(
                  'Continue - \$${controller.calculateTotalCost().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDetailsPage extends StatelessWidget {
  final BookingController controller = Get.find();

  BookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double totalCost = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Obx(() => CalendarDatePicker(
                    initialDate: controller.selectedDate.value,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    onDateChanged: (date) {
                      controller.selectedDate.value = date;
                    },
                  )),
              const SizedBox(height: 16),
              const Text('Working Hours',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () {
                          if (controller.workingHours > 0) {
                            controller.workingHours--;
                          }
                        },
                      ),
                      Text(controller.workingHours.toString(),
                          style: const TextStyle(fontSize: 18)),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: () {
                          controller.workingHours++;
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 16),
              const Text('Choose Start Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Wrap(
                    spacing: 10.0,
                    children: ['09:00 AM', '10:00 AM', '11:00 AM', '01:00 PM']
                        .map((time) => ChoiceChip(
                              label: Text(time),
                              selected: controller.startTime.value == time,
                              onSelected: (selected) {
                                if (selected) {
                                  controller.startTime.value = time;
                                }
                              },
                            ))
                        .toList(),
                  )),
              const SizedBox(height: 26),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Promo Code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar('Booking Confirmed',
                      'Your total cost is \$${totalCost.toStringAsFixed(2)}');

                  Get.to(() => LocationPage());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                    'Confirm Payment - \$${totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
