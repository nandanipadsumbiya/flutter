import 'package:get/get.dart';
import '../models/user_model.dart';
import '../models/medicine_model.dart';
import '../database/database_helper.dart';
import '../screens/login_page.dart';

class HomeController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  
  // Navigation
  var selectedIndex = 0.obs;
  
  // User data
  var currentUser = Rxn<UserModel>();
  
  // Today's medicines
  var todaysMedicines = <MedicineModel>[].obs;
  var isLoadingTodaysMedicines = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadTodaysMedicines();
  }
  
  void setUser(UserModel user) {
    currentUser.value = user;
    loadTodaysMedicines();
  }
  
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
  
  // Load today's medicines for the current user
  Future<void> loadTodaysMedicines() async {
    if (currentUser.value == null) return;
    
    try {
      isLoadingTodaysMedicines.value = true;
      final medicines = await _databaseHelper.getTodaysMedicines(currentUser.value!.id);
      todaysMedicines.value = medicines;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load today\'s medicines: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoadingTodaysMedicines.value = false;
    }
  }
  
  // Navigation methods
  void navigateToAddMedicine() {
    Get.toNamed('/add-medicine');
  }
  
  void navigateToSetReminder() {
    Get.toNamed('/set-reminder');
  }
  
  void navigateToHistory() {
    Get.toNamed('/history');
  }
  
  void navigateToReports() {
    Get.toNamed('/reports');
  }
  
  // void logout() {
  //   Get.dialog(
  //     AlertDialog(
  //       title: const Text('Logout'),
  //       content: const Text('Are you sure you want to logout?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Get.back(),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Get.back();
  //             currentUser.value = null;
  //             todaysMedicines.clear();
  //             Get.offAll(() => const LoginPage());
  //           },
  //           child: const Text(
  //             'Logout',
  //             style: TextStyle(color: Colors.red),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
