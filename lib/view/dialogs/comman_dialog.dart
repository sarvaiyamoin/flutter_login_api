import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog {
  static showLoading({String title = "Loading....."}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    ));
  }

  static hideDialog() {
    Get.back();
  }

  static showErrorDialog(
      {String title = "Error", String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Get.textTheme.headline6,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(description),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ],
        ),
      ),
    ));
  }
}
