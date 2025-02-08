import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/cor/constants.dart';
import 'package:final_project/ui/widget/build_services.dart';
import 'package:final_project/ui/widget/container.dart';
import 'package:final_project/ui/widget/service_item.dart';
import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:final_project/view_models/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final SearchControllerrr searchController = Get.put(SearchControllerrr());
  final BookmarkController bookmarkController = Get.put(BookmarkController());

  final List<Map<String, dynamic>> services = [
    {"icon": Icons.cleaning_services, "name": "Cleaning"},
    {"icon": Icons.handyman, "name": "Repairing"},
    {"icon": Icons.brush, "name": "Painting"},
    {"icon": Icons.plumbing, "name": "Plumbing"},
    {'icon': Icons.plumbing, 'name': 'Plumbing'},
    {'icon': Icons.local_shipping, 'name': 'Shifting'},
    {'icon': Icons.face_retouching_natural, 'name': 'Beauty'},
    {'icon': Icons.ac_unit, 'name': 'AC Repa.'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Good Morning 👋\n$userName',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.black),
                    onPressed: () {
                      Get.toNamed("/notificationScreen");
                    },
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.bookmark_outline, color: Colors.black),
                    onPressed: () {
                      Get.toNamed("/bookmarkScreen");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 26),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onTap: () {
                    Get.toNamed('/searchScreen');
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Search for services...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: [
                  SpecialOfferCard(
                    title: "30% Today's Special!",
                    subtitle:
                        "Get discount for every order, only valid for today",
                    backgroundColor: Colors.purple.shade50,
                    titleColor: Colors.purple,
                    subtitleColor: Colors.purple.shade700,
                  ),
                  SpecialOfferCard(
                    title: "50% Off!",
                    subtitle:
                        "Hurry up! Offer valid till midnight, only valid for today",
                    backgroundColor: Colors.blue.shade50,
                    titleColor: Colors.blue,
                    subtitleColor: Colors.blue.shade700,
                  ),
                ],
              ),

              const SizedBox(height: 22),


              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Services',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/allServicesScreen");
                    },
                    child: const Text('See All',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return buildServiceItem(service['icon'], service['name']);
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Most Popular Services',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/popularServicesScreen");
                      },
                      child: const Text('See All',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold))),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Column(
                    children: bookmarkController.services.map((service) {
                      if (service['name'] == null || service['price'] == null) {
                        debugPrint('Invalid service data: $service');
                        return const SizedBox(); // أو عرض رسالة خطأ
                      }
                      return ServiceItem(
                        title: service['name'].toString(),
                        price: service['price'].toString(),
                        rating: double.tryParse(service['rating'].toString()) ??
                            0.0,
                        reviews: service['reviews'].toString(),
                        image: service['image'].toString(),
                        isBookmarked: bookmarkController.bookmarkedServices
                            .contains(service['id']),
                        onBookmarkPressed: () {
                          if (bookmarkController.bookmarkedServices
                              .contains(service['id'])) {
                            bookmarkController
                                .removeService(service['id'] as int);
                          } else {
                            bookmarkController
                                .addBookmark(service['id'] as int);
                          }
                        },
                      );
                    }).toList(),
                  )),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
