import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiErrorDialog {
  void badRequest(String error) {
    Get.defaultDialog(
        title: "Failed", content: Center(child: Text("Bad request : $error")));
  }

  void unAuthorized() {
    Get.defaultDialog(
        title: "Failed", content: const Center(child: Text("Unauthorized")));
  }

  void serverError(int statusCode) {
    Get.defaultDialog(
        title: "Failed",
        content: Center(child: Text("Server error : $statusCode")));
  }

  void noInternet() {
    Get.defaultDialog(
      title: "Failed",
      content: const Center(child: Text("No Internet ...")),
    );
  }

  void timeout() {
    Get.defaultDialog(
        title: "Failed",
        content: const Center(child: Text("TimeoutException")));
  }

  void failed(String message) {
    Get.defaultDialog(title: "Failed", content: Center(child: Text(message)));
  }
}
