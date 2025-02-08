import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/view_models/booking_controller.dart';

class ReviewSummaryPage extends StatelessWidget {
  final BookingController controller = Get.find();

  ReviewSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Summary'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Service Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category: ${controller.category.value}',
                        style: const TextStyle(fontSize: 16)),
                    Text(
                        'Date & Time: ${controller.selectedDate.value.toLocal()} at ${controller.startTime.value}',
                        style: const TextStyle(fontSize: 16)),
                    Text('Working Hours: ${controller.workingHours.value}',
                        style: const TextStyle(fontSize: 16)),
                    Text('Address: ${controller.addressController.text}',
                        style: const TextStyle(fontSize: 16)),
                    Text(
                        'Payment Method: ${controller.selectedPaymentMethod.value}',
                        style: const TextStyle(fontSize: 16)),
                  ],
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // تنفيذ الطلب
                Get.snackbar('Success', 'Your booking has been confirmed!');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:
                  const Text('Confirm Payment', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
