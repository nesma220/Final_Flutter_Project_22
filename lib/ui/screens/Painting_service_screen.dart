import 'package:final_project/ui/screens/service_details_scrreen.dart';
import 'package:final_project/ui/widget/service_item.dart';
import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaintingPage extends StatelessWidget {
  final BookmarkController bookmarkController = Get.find();
  final String serviceName;
  final Map<String, dynamic> serviceData;
  PaintingPage(
      {super.key, required this.serviceName, required this.serviceData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: bookmarkController.services
                .where((service) => service['category'] == 'Painting')
                .map((service) {
              return ServiceItem(
                title: service['name'].toString(),
                price: service['price'].toString(),
                rating: double.tryParse(service['rating'].toString()) ?? 0.0,
                reviews: service['reviews'].toString(),
                image: service['image'].toString(),
                isBookmarked: bookmarkController.bookmarkedServices
                    .contains(service['id']),
                onBookmarkPressed: () {
                  if (bookmarkController.bookmarkedServices
                      .contains(service['id'])) {
                    bookmarkController.removeService(service['id'] as int);
                  } else {
                    bookmarkController.addBookmark(service['id'] as int);
                  }
                },
                ontap: () {
                  Get.snackbar("Service", "You clicked on ${service['name']}");
                  Get.to(() => ServiceDetailsPage(serviceData: service));
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
