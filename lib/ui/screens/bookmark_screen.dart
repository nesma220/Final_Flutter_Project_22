import 'package:final_project/ui/widget/service_item.dart';
import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookmarkScreen extends StatelessWidget {
  final BookmarkController bookmarkController =
      Get.find<BookmarkController>();

  MyBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          final bookmarkedServices = bookmarkController.services
              .where((service) =>
                  bookmarkController.bookmarkedServices.contains(service['id']))
              .toList();

          return bookmarkedServices.isEmpty
              ? const Center(child: Text('No bookmarks found.'))
              : ListView.builder(
                  itemCount: bookmarkedServices.length,
                  itemBuilder: (context, index) {
                    final service = bookmarkedServices[index];
                    return ServiceItem(
                      title: service['name'].toString(),
                      price: service['price'].toString(),
                      rating:
                          double.tryParse(service['rating'].toString()) ?? 0.0,
                      reviews: service['reviews'].toString(),
                      image: service['image'].toString(),
                      isBookmarked: true,
                      onBookmarkPressed: () {
                        bookmarkController.removeService(service['id'] as int);
                      },
                    );
                  },
                );
        }));
  }
}
