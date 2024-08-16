import 'package:employee_monitor/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailHomeScreen extends StatefulWidget {
  const DetailHomeScreen({super.key});

  @override
  State<DetailHomeScreen> createState() => _DetailHomeScreenState();
}

class _DetailHomeScreenState extends State<DetailHomeScreen> {
  final HomeController controller = Get.put(HomeController());
  String status = Get.arguments ?? '';	
  
  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        controller.fetchReportPerStatus(status);
        return Scaffold(
          appBar: AppBar(
            title: Text('Detail Report $status'),
          ),
          body: ListView.builder(
            itemCount: controller.listReport.length,
            itemBuilder: (context, index) {
              final report = controller.listReport[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Outline border
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    "Nama: ${report.title}",
                  ),
                  subtitle: Text(
                    "Desc : ${report.content}\nReported at: ${report.reportDate}",
                  ),
                ),
              );
            }),
        );
      }
      
    );
  }
}
