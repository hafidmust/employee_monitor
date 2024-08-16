import 'package:employee_monitor/screens/home/detail_home.dart';
import 'package:employee_monitor/screens/home/home_controller.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:employee_monitor/widget/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final HomeController controller = Get.put(HomeController());

  // Fungsi untuk merefresh data
  Future<void> _refreshData() async {
    await controller.fetchListMenu(); 
    await controller.fetchSummary();// Panggil fungsi fetchMenu dari controller untuk memuat ulang data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: CustomColor.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            onRefresh: _refreshData, // Panggil _refreshData saat di-refresh
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(), // Ini diperlukan agar RefreshIndicator dapat bekerja dengan baik
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                    child: Text("Welcome",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Obx((){
                    return LayoutGrid(
                      columnSizes: [1.fr, 1.fr],
                      rowSizes: [auto, auto, auto],
                      rowGap: 10,
                      columnGap: 10,
                      children: [
                        _buildGridCard("${controller.dataSummary.value.pENDING ?? "-"}", 'Pending', Colors.orange,(){
                          Get.to(() => DetailHomeScreen(),arguments: 'PENDING');
                        })
                            .withGridPlacement(columnStart: 0, rowStart: 0, rowSpan: 2),
                        _buildGridCard("${controller.dataSummary.value.aCCEPTED  ?? "-"}", 'Acc', Colors.green,(){
                          Get.to(()=> DetailHomeScreen(),arguments: 'ACCEPTED');
                        })
                            .withGridPlacement(columnStart: 1, rowStart: 0),
                        _buildGridCard("${controller.dataSummary.value.rEJECTED  ?? "-"}", 'Reject', Colors.red,(){
                          Get.to(()=> DetailHomeScreen(),arguments: 'REJECTED');	
                        })
                            .withGridPlacement(columnStart: 1, rowStart: 1),
                      ],
                    );
                  }
                    
                  ),
                  SizedBox(height: 16.0),
                  Text('Menu',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: controller.listMenu.map((item) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CircleIconButton(
                            icon: item.icon,
                            text: item.text,
                            color: item.color,
                            onPressed: () {
                              Navigator.pushNamed(context, item.route);
                            },
                          ),
                        );
                      }).toList(),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildGridCard(String count, String title, Color color, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
