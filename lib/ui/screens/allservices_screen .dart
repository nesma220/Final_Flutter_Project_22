import 'package:final_project/ui/screens/Cleaning_service_screen.dart';
import 'package:final_project/ui/screens/Laundry_service_screen.dart';
import 'package:final_project/ui/screens/Painting_service_screen.dart';
import 'package:final_project/ui/screens/Repairing_service_screen.dart';
import 'package:final_project/ui/screens/appliance_service_screen.dart';
import 'package:final_project/ui/screens/plumbing_servise_screen.dart';
import 'package:final_project/ui/screens/shifting_service_screen.dart';
import 'package:final_project/ui/widget/build_services.dart';
import 'package:final_project/view_models/allservices_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesScreen extends StatelessWidget {
  final AllServicesController controller = Get.put(AllServicesController());
  String? serviceName = "";

  AllServicesScreen({super.key, this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Services",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: controller.services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final service = controller.services[index];
            return GestureDetector(
              onTap: () {
                var service = controller
                    .services[index]; 
                if (service['name'] == 'Cleaning') {
                  Get.to(() => CleaningPage(
                      serviceName: service['name'], serviceData: service));
                } else if (service['name'] == 'Repairing') {
                  Get.to(() => RepairingPage(
                      serviceName: service['name'], serviceData: service));
                } else if (service['name'] == 'Painting') {
                  Get.to(() => PaintingPage(
                      serviceName: service['name'], serviceData: service));
                } else if (service['name'] == 'Laundry') {
                  Get.to(() => LaundryPage(
                      serviceName: service['name'], serviceData: service));
                } else if (service['name'] == 'Appliance') {
                  Get.to(() => AppliancePage(
                      serviceName: service['name'], serviceData: service));
                } else if (service['name'] == 'Plumbing') {
                  Get.to(() => PlumbingPage(
                      serviceName: service['name'], serviceData: service));
                } else if (service['name'] == 'Shifting') {
                  Get.to(() => ShiftingPage(
                      serviceName: service['name'], serviceData: service));
                } else {
                  serviceName ??= 'Default Service';
                }
              },
              child: buildServiceItem(service['icon'], service['name']),
            );
          },
        ),
      ),
    );
  }
}
