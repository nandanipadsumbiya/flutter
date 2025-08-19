// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../database/database_helper.dart';
// import '../screens/home_page.dart'; // 👈 HomePage import karo
//
// class LoginController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//
//   // Text Controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   // Password visibility
//   var obscurePassword = true.obs;
//
//   // Loading state
//   var isLoading = false.obs;
//
//   // Database instance
//   final DatabaseHelper dbHelper = DatabaseHelper();
//
//   // Handle login
//   Future<void> handleLogin(BuildContext context) async {
//     if (!formKey.currentState!.validate()) return;
//
//     isLoading.value = true;
//
//     try {
//       final result = await dbHelper.loginUser(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(), usernameOrEmail: '',
//       );
//
//       if (result['success']) {
//         Get.snackbar(
//           "Success",
//           result['message'],
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );
//
//         _clearFields();
//
//         // Navigate to HomePage
//         Get.offAll(() => HomePage(user: null,));
//       } else {
//         Get.snackbar(
//           "Error",
//           result['message'],
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         "Login Error",
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Clear text fields
//   void _clearFields() {
//     emailController.clear();
//     passwordController.clear();
//   }
//
//   // Dispose controllers
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.onClose();
//   }
// }
