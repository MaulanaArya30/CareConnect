import 'package:flutter/material.dart';
import 'package:gdscapp/models/profile_model.dart';
import 'package:gdscapp/repository/alert_repository.dart';
import 'package:gdscapp/repository/profile_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/alert_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //final _profileRepo = Get.put(ProfileRepository());

  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final cardname = TextEditingController();
  final cardnumber = TextEditingController();
  final securitycode = TextEditingController();
  final expiredate = TextEditingController();

  final profilerepo = Get.put(ProfileRepository());

  void createProfile(ProfileModel user) {
    profilerepo.createProfile(user);
  }

  // void updateProfile(ProfileModel user) async {
  //   await profilerepo.updateProfile(user);
  // }
}
