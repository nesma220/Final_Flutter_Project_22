import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final IconData icon;

  const SocialMediaButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}

class SignInButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color Textcolor;
  final IconData? icon;
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.text,
    this.Textcolor = Colors.white,
    required this.color,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: TextStyle(color: Textcolor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
      ),
    );
  }
}
