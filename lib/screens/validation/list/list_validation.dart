import 'package:employee_monitor/models/report.dart';
import 'package:flutter/material.dart';

class ListValidationScreen extends StatefulWidget {
  const ListValidationScreen({super.key});

  @override
  State<ListValidationScreen> createState() => _ListValidationScreenState();
}

class _ListValidationScreenState extends State<ListValidationScreen> {
  final List<ResponseData> reports = [
    ResponseData(id: 1, title: 'Laporan 1', content: 'Content 1', reportDate: '2021-08-12', photoUrl: 'https://srimulyo-bantul.desa.id/desa/upload/artikel/sedang_1596975134_Kantor%20Kelurahan%20Desa%20Srimulyo.jpg'),
    ResponseData(id: 1, title: 'Laporan 1', content: 'Content 1', reportDate: '2021-08-12', photoUrl: 'https://srimulyo-bantul.desa.id/desa/upload/artikel/sedang_1596975134_Kantor%20Kelurahan%20Desa%20Srimulyo.jpg'),
    ResponseData(id: 1, title: 'Laporan 1', content: 'Content 1', reportDate: '2021-08-12', photoUrl: 'https://srimulyo-bantul.desa.id/desa/upload/artikel/sedang_1596975134_Kantor%20Kelurahan%20Desa%20Srimulyo.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Validation'),
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index){
          final report = reports[index];
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
                  Navigator.pushNamed(context, '/detail_validation');
                },
              ),
            ),
          );
      })
    );
  }
}