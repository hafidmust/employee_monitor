import 'package:employee_monitor/screens/history/laporan/laporan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class LaporanScreen extends StatefulWidget {
  const LaporanScreen({super.key});

  @override
  State<LaporanScreen> createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  final LaporanController controller = Get.put(LaporanController());
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(controller.isLoading.value){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(controller.dataReport.isEmpty){
          return      Center(
        child: Lottie.network('https://lottie.host/2a1fcf5c-8278-4daa-8cbd-3e214f32f8c7/VfQ1FxXqJs.json',width: 300,height: 300),
      );

      }else{
        return RefreshIndicator(
          key: _refreshKey,
          onRefresh: ()async {
            controller.fetchReport;
          },
          child: ListView.builder(
          itemCount: controller.dataReport.length,
          itemBuilder: (context, index){
            final report = controller.dataReport[index];
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
                  "Desc : ${report.content}\nReported at: ${
                    report.reportDate
                  }",
                ),
                
              ),
            );
                }),
        );
      }})
    );
  }
}