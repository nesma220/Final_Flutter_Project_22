import 'package:flutter/material.dart';

Widget buildServiceItem(IconData icon, String label) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.purple[50],
        child: Icon(icon, color: Colors.purple),
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 14)),
    ],
  );
}
