import 'package:employee_monitor/screens/register/register_controller.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecureText = true;
  final RegisterController controller = Get.put(RegisterController());
  TextEditingController namaController = TextEditingController();
  TextEditingController nipController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.red,
        foregroundColor: Colors.white,
        title: Text('Register', style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx((){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.0),
                  Text('Nama'),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: namaController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('NIP'),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: nipController,
                    decoration: InputDecoration(
                      hintText: 'NIP',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('Username'),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('Password'),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: passwordController,
                    obscureText: obsecureText,
                    decoration: InputDecoration(
                      hintText: 'Masukkan password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      suffixIcon: IconButton(
                        icon: (obsecureText) ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                        onPressed: (){
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                      )
                    ),
                  ),
                  
                  SizedBox(height: 16.0),
                  Text('Jabatan'),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: jabatanController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan jabatan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
                  SizedBox(height: 16.0),
                  if(controller.isLoading.value) Center(child: CircularProgressIndicator(),) else ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: CustomColor.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: ()async {
                      final request = await controller.register(
                        namaController.text,
                        nipController.text,
                        usernameController.text,
                        jabatanController.text,
                        passwordController.text,
                      );
                      if(request.message == 'success'){
                          Get.back();
                      }
                    },
                    child: Text('Register', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ],
              );
            }
              
            ),
          ),
        ),
      ),
    );
  }
}