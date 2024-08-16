import 'package:employee_monitor/screens/history/kegiatan/kegiatan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class KegiatanScreen extends StatefulWidget {
  const KegiatanScreen({super.key});

  @override
  State<KegiatanScreen> createState() => _KegiatanScreenState();
}

class _KegiatanScreenState extends State<KegiatanScreen> {
  final KegiatanController controller = Get.put(KegiatanController());
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.listTaskAssigned.isEmpty) {
          return Center(
            child: Lottie.network(
                'https://lottie.host/2a1fcf5c-8278-4daa-8cbd-3e214f32f8c7/VfQ1FxXqJs.json',
                width: 300,
                height: 300),
          );
        } else {
          return RefreshIndicator(
            key: _refreshKey,
            onRefresh: () async {
              controller.fetchTaskAssigned;
            },
            child: ListView.builder(
                itemCount: controller.listTaskAssigned.length,
                itemBuilder: (context, index) {
                  final task = controller.listTaskAssigned[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Outline border
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        task.description!,
                      ),
                      subtitle: Text(
                        "Assigned by : ${task.assignedBy!.username.toString()}\nDeadline : ${task.dueDate.toString()}",
                      ),
                      
                    ),
                  );
                }),
          );
        }
      }),
    );
  }
}
