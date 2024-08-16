import 'package:employee_monitor/screens/validation/detail/detail_validation_controller.dart';
import 'package:employee_monitor/services/api_services.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:employee_monitor/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailValidationScreen extends StatefulWidget {
  const DetailValidationScreen({super.key});

  @override
  State<DetailValidationScreen> createState() => _DetailValidationScreenState();
}

class _DetailValidationScreenState extends State<DetailValidationScreen> {
  // final Map<String, dynamic> args = Get.arguments;
  // var dataId = args['id'];
  final DetailValidationController controller =
      Get.put(DetailValidationController());
  @override
  Widget build(BuildContext context) {
    String? dataId = Get.parameters['id'];
    controller.fetchValidation(dataId!);
    // controller.extractFileName(controller.dataValidation.value.photoUrl!);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Validation'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          Color getBackgroundColor(String status) {
          switch (status) {
            case 'ACCEPTED':
              return Colors.blue;
            case 'REJECTED':
              return Colors.red;
            case 'PENDING':
            default:
              return Colors.orange;
          }
        }
       return  controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            :
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.fileName.value.isNotEmpty
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                          '${ApiServices().BASE_URL}/${controller.fileName.value}',
                          fit: BoxFit.fill),
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          'No Image',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title : '),
                            Text(
                              "${controller.dataValidation.value.title}",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text("Detail : "),
                            Text(
                              "${controller.dataValidation.value.content}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text("Report Date : "),
                            Text(
                              "${controller.dataValidation.value.reportDate}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Reported by : ${controller.dataValidation.value.user?.fullName ?? '-'}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text("Status : "),
                                Chip(
                                  side: BorderSide(color: Colors.white),
                                  label: Text(
                                    "${controller.dataValidation.value.status}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: getBackgroundColor(controller.dataValidation.value.status!),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () async {
                                final req = await controller.updateAccValidation(dataId);
                                if (req) {
                                  // Get.back();
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Berhasil menyetujui laporan')));
                          Navigator.pop(context);
                                  
                                }
                              },
                              child: Text(
                                "Approve",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: CustomColor.red)),
                              onPressed: () {
                                _showRejectDialog(dataId);
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(color: CustomColor.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void _showRejectDialog(String id) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Are you sure?",
      buttons: [
        DialogButton(
          child: Text(
            "Reject",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            final req = await controller.updateRejectValidation(id);
            if (req) {
              
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Berhasil menolak laporan')));
                  controller.fetchValidation(id);
            }
          },
          color: CustomColor.red,
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }
}
