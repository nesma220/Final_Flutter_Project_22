import 'package:final_project/ui/widget/service_item.dart';
import 'package:final_project/view_models/bookmarke_controller.dart';
import 'package:final_project/view_models/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final searchControllerInstance =
      Get.put(SearchControllerrr()); // Assuming GetX is used
  final BookmarkController bookmarkController = Get.put(BookmarkController());

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Services'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search for a service...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onChanged: (query) {
                searchControllerInstance.filterServices(query);
              },
            ),
          ),
          // Filtered Services List
          Expanded(
            child: Obx(() {
              final filteredServices =
                  searchControllerInstance.filteredServices;

              if (filteredServices.isEmpty) {
                return const Center(child: Text('No results found.'));
              }

              return ListView.builder(
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  final service = filteredServices[index];
                  return ServiceItem(
                    title: service['name'].toString(),
                    price: service['price'].toString(),
                    rating:
                        double.tryParse(service['rating'].toString()) ?? 0.0,
                    reviews: service['reviews'].toString(),
                    image: service['image'].toString(),
                    isBookmarked: bookmarkController.bookmarkedServices
                        .contains(service['id']),
                    onBookmarkPressed: () {
                      if (bookmarkController.bookmarkedServices
                          .contains(service['id'])) {
                        bookmarkController.removeService(service['id']);
                      } else {
                        bookmarkController.addBookmark(service['id']);
                      }
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
