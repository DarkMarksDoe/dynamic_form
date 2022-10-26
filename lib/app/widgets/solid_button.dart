import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({super.key, required this.action, required this.text});
  final VoidCallback action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 44,
      child: TextButton(
        onPressed: action,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
