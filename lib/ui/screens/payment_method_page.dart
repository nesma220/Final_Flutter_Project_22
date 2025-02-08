import 'package:final_project/ui/screens/review_summary_page.dart';
import 'package:final_project/view_models/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsPage extends StatelessWidget {
  final BookingController controller = Get.find();

  PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Payment Methods '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(

              'Select the payment method you want to use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),


              
            ),
            const SizedBox(height: 16),
            Obx(() => Column(
                  children: controller.paymentMethods.keys.map((method) {
                    return RadioListTile<String>(
                      value: method,
                      groupValue: controller.selectedPaymentMethod.value,
                      title: Text(method),
                      onChanged: (value) {
                        controller.selectedPaymentMethod.value = value!;
                      },
                    );
                  }).toList(),
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ReviewSummaryPage());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Continue', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
