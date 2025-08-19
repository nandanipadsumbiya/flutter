import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../controller/home_controller.dart';


class HomePage extends StatelessWidget {
  final UserModel user;
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key, required this.user});

  final List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    _pages.addAll([
      _buildHomePage(),
      _buildMedicinesPage(),
      _buildProfilePage(),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("MediCare"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              // if (value == 'logout') {
              //   controller.logout();
              // }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text("Logout"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      body: Obx(() => _pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.medication), label: "Medicines"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome back,"),
              Text(
                user.fullName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("Stay healthy, take your medicines on time!"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: [
            _buildActionCard(Icons.add_circle_outline, "Add Medicine"),
            _buildActionCard(Icons.schedule, "Set Reminder"),
            _buildActionCard(Icons.history, "History"),
            _buildActionCard(Icons.analytics, "Reports"),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Today's Medicines", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            children: [
              Icon(Icons.medication_outlined, size: 50, color: Colors.grey),
              SizedBox(height: 10),
              Text("No medicines scheduled for today"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildActionCard(IconData icon, String title) {
    return Card(
      child: InkWell(
        onTap: () => Get.snackbar("Info", "$title feature coming soon!"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicinesPage() {
    return const Center(
      child: Text("Medicines Page"),
    );
  }

  Widget _buildProfilePage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CircleAvatar(
          radius: 50,
          child: Icon(Icons.person, size: 50, color: Colors.blue[600]),
        ),
        const SizedBox(height: 10),
        Text(user.fullName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("@${user.username}", style: const TextStyle(color: Colors.grey)),
        Text(user.email, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text("Edit Profile"),
          onTap: () => Get.snackbar("Info", "Edit Profile coming soon!"),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text("Notification Settings"),
          onTap: () => Get.snackbar("Info", "Notification Settings coming soon!"),
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text("Privacy & Security"),
          onTap: () => Get.snackbar("Info", "Privacy & Security coming soon!"),
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text("Help & Support"),
          onTap: () => Get.snackbar("Info", "Help & Support coming soon!"),
        ),
        // ListTile(
        //   leading: const Icon(Icons.logout, color: Colors.red),
        //   title: const Text("Logout", style: TextStyle(color: Colors.red)),
        //   // onTap: controller.logout,
        // ),
      ],
    );
  }
}
