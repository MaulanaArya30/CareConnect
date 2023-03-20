import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdscapp/models/alert_model.dart';
import 'package:get/get.dart';

class AlertRespository extends GetxController {
  static AlertRespository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createAlert(AlertModel alert) async {
    await _db
        .collection("alert")
        .add(alert.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Alert has been sent.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.greenAccent.withOpacity(1),
              colorText: Colors.black),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Somehting went wrong. Please try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(1),
          colorText: Colors.black);
      print(error.toString());
    });
  }
}
