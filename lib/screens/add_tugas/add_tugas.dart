import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:employee_monitor/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddTugasScreen extends StatefulWidget {
  const AddTugasScreen({super.key});

  @override
  State<AddTugasScreen> createState() => _AddTugasScreenState();
}

class _AddTugasScreenState extends State<AddTugasScreen> {
  List<String> items = ['Budi', 'Dewi', 'Rizki'];
  String? _selectedItem;
  DateTime? _selectedDate;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Text('Staff : '),
            DropdownButtonFormField2(
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
              items: items.map((item)=>DropdownMenuItem<String>(child: Text(item), value: item,)).toList(), onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },),
            Text('Deskripsi :'),
            CustomTextField(hintText: 'Deskripsi'),
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
            ElevatedButton(onPressed: (){}, child: Text('Simpan'))
        
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