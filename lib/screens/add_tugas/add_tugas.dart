import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:employee_monitor/models/list_staff.dart';
import 'package:employee_monitor/screens/add_laporan/add_laporan_controller.dart';
import 'package:employee_monitor/screens/add_tugas/add_tugas_controller.dart';
import 'package:employee_monitor/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddTugasScreen extends StatefulWidget {
  const AddTugasScreen({super.key});

  @override
  State<AddTugasScreen> createState() => _AddTugasScreenState();
}

class _AddTugasScreenState extends State<AddTugasScreen> {
  final AddTugasController controller = Get.put(AddTugasController());
  List<String> items = ['Budi', 'Dewi', 'Rizki'];
  ResponseData? _selectedItem;
  DateTime? _selectedDate;  
  TextEditingController descController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Tambah Tugas'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Text('Staff : '),
            Obx((){
              if(controller.isLoading.value){
                return CircularProgressIndicator();
              }
              return DropdownButtonFormField2(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              hint: Text('Pilih user'),
              isExpanded: true,
              value: _selectedItem,
              items: controller.dataStaff.map((item){
                return DropdownMenuItem<ResponseData>(
                  value: item, 
                  child: Text(item.fullName ?? ''),);
              }).toList(), 
              
              onChanged: (ResponseData? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                },
              );
            }),
            Text('Deskripsi :'),
            CustomTextField(hintText: 'Deskripsi', controller: descController,),
            SizedBox(height: 16.0),
            Text('Tanggal :'),
            CustomTextField(
                  readOnly: true,
                  hintText: _selectedDate == null ? 'Pilih tanggal' :'${_selectedDate!.toLocal()}'.split(' ')[0],
                  suffixIcon: IconButton(
                    icon: Icon(Icons.date_range),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
            SizedBox(height: 16.0),
            
              ElevatedButton(
                onPressed: ()async{
                  final req = await controller.addTask(
                    _selectedItem!.id!,
                    descController.text,
                    _selectedDate.toString()
                  );
                  if(req){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Berhasil menambahkan tugas')));
                    Navigator.pop(context);                 
                  }
                }, 
                child: Text('Tambah Tugas'))
        
          ],
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(helpText:'Silahkan pilih tanggal', context: context, firstDate: DateTime(2020), lastDate: DateTime(2030));
    if(picked != null){
      setState(() {
        print(picked);
        _selectedDate = picked;
      });
    }
  }
}
