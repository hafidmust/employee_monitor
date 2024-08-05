import 'package:employee_monitor/utils/colors.dart';
import 'package:employee_monitor/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailValidationScreen extends StatefulWidget {
  const DetailValidationScreen({super.key});

  @override
  State<DetailValidationScreen> createState() => _DetailValidationScreenState();
}

class _DetailValidationScreenState extends State<DetailValidationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Validation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network('https://srimulyo-bantul.desa.id/desa/upload/artikel/sedang_1596975134_Kantor%20Kelurahan%20Desa%20Srimulyo.jpg', 
              fit: BoxFit.fill),
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
                            "Laporan...z",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text("Report Date : "),
                          Text(
                            "2021-08-12",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Reported by : Muhammad Rafih",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                                      
                            children: [
                              Text("Status : "),
                              Chip(
                                side: BorderSide(color: Colors.white),
                                label: Text("PENDING", style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.orange,
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
                            backgroundColor: Colors.green
                          ),
                          onPressed: () {},
                          child: Text("Approve", style: TextStyle(
                            color: Colors.white
                          ),),
                          
                        ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: CustomColor.red)
                          ),
                          onPressed: () {
                            _showRejectDialog();
                          },
                          child: Text("Reject", style: TextStyle(
                            color: CustomColor.red
                          ),),
                        ),
                        ),
                      ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showRejectDialog() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Alasan",
      content: Column(
        children: [
          CustomTextField(hintText: "Alasan Penolakan", maxLines: 5),	
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
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
