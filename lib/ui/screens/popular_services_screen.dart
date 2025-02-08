import 'package:final_project/view_models/popular_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularServicesScreen extends StatelessWidget {
  final PopularServicesController controller =
      Get.put(PopularServicesController());

  PopularServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular Services'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => ListView.builder(
              itemCount: controller.services.length,
              itemBuilder: (context, index) {
                final service = controller.services[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset(service['image'] as String,
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(service['name'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        Text("\$${service['price']}"),
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(
                            "${service['rating']} | ${service['reviews']} reviews"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        controller.isBookmarked(service['id'] as int)
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        controller.toggleBookmark(service['id'] as int);
                      },
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
