import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdscapp/models/alert_model.dart';
import 'package:gdscapp/models/profile_model.dart';
import 'package:get/get.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createProfile(ProfileModel user) async {
    await _db
        .collection("users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Profile data has been sent.",
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

  // updateProfile(ProfileModel user) async {
  //   await _db.collection("users").doc(user.id).update(user.toJson());
  // }
}
