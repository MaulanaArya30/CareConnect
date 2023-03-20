import 'package:flutter/material.dart';
import 'package:gdscapp/repository/alert_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/alert_model.dart';

class AlertController extends GetxController {
  static AlertController get instance => Get.find();

  final rname = TextEditingController();
  final rphone = TextEditingController();
  final oname = TextEditingController();
  final obirth = TextEditingController();
  final oconditions = TextEditingController();
  final olocation = TextEditingController();

  final alertRepo = Get.put(AlertRespository());

  void createAlert(AlertModel alert) {
    alertRepo.createAlert(alert);
  }
}
