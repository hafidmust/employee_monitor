import 'package:employee_monitor/models/report.dart';
import 'package:employee_monitor/screens/validation/list/list_validation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ListValidationScreen extends StatefulWidget {
  const ListValidationScreen({super.key});

  @override
  State<ListValidationScreen> createState() => _ListValidationScreenState();
}

class _ListValidationScreenState extends State<ListValidationScreen> {
  final ListValidationController controller = Get.put(ListValidationController());
  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Validation'),
      ),
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
                  report.title!,
                ),
                subtitle: Text(
                  report.content!,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: (){
                    // Navigator.pushNamed(context, '/detail_validation');
                    Get.toNamed('/detail_validation/${report.id}');
                  },
                ),
              ),
            );
                }),
        );
      }})
    );
  }
}