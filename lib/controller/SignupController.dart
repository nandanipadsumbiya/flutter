import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../database/database_helper.dart';
import '../models/user_model.dart';
import '../screens/home_page.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Password visibility
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  // Loading state
  var isLoading = false.obs;

  // Database instance
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Handle signup
  Future<void> handleSignup(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final result = await dbHelper.registerUser(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fullName: fullNameController.text.trim(),
    );


    isLoading.value = false;

    if (result['success']) {
      Get.snackbar("Success", result['message'],
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);

      // Clear fields after success
      fullNameController.clear();
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      // Create UserModel from the result
      UserModel user = UserModel.fromMap(result['user']);
      Get.offAll(() => HomePage(user: user));


      // Navigate to home page
      Get.offAll(() => HomePage(user: user));
    } else {
      Get.snackbar("Error", result['message'],
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
