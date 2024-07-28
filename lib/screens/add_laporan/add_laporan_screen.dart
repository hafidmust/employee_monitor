import 'dart:io';

import 'package:employee_monitor/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddLaporanScreen extends StatefulWidget {
  const AddLaporanScreen({super.key});

  @override
  State<AddLaporanScreen> createState() => _AddLaporanScreenState();
}

class _AddLaporanScreenState extends State<AddLaporanScreen> {
  DateTime? _selectedDate;
  File? _image;

  Future pickImage(ImageSource source) async {
    try{
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    }catch(e){
      print(e);
    }
  }
  void _removeImage(){
    setState(() {
      _image = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Laporan'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Text('Judul :'),
              SizedBox(height: 8.0),
              CustomTextField(hintText: 'Masukkan laporan'),
              SizedBox(height: 16.0),
              Text('Isi :'),
              SizedBox(height: 8.0),
              CustomTextField(
                hintText: 'Masukkan isi laporan',
                maxLines: 5,
              ),
              SizedBox(height: 16.0),
              Text('Tanggal : '),
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
              Text('Lampiran : '),
              SizedBox(height: 8.0),
              _image != null? Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: (){
                            _removeImage();
                          },
                        ),
                      ),
                    ],
                  ) :
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      //camera
                      pickImage(ImageSource.camera);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      child: Icon(Icons.add_a_photo, color: Colors.grey[400], size: 40,),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: (){
                      // gallery
                      pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      child: Icon(Icons.add_photo_alternate, color: Colors.grey[400], size: 40,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('Simpan')),
                  SizedBox(width: 8.0),
                  ElevatedButton(onPressed: (){}, child: Text('Reset')),
                ],
              )
            ],
          ),
        ));
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
