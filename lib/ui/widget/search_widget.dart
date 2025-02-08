import 'package:flutter/material.dart';

Widget _buildNotFound() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.search_off, size: 80, color: Colors.grey),
      SizedBox(height: 16),
      Text(
        "Not Found",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text("Sorry, no results found for your search."),
    ],
  );
}
