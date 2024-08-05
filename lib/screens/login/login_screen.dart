import 'package:employee_monitor/screens/login/login_controller.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecureText = true;
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: CustomColor.red,

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        obsecureText ? Icons.visibility: Icons.visibility_off
                      ),
                      onPressed: (){
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                    ),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),
                SizedBox(height: 32.0),
                Obx((){
                  return loginController.isLoading.value ? Center(child: CircularProgressIndicator(),) : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.red,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: () async {
                            try {
                              final login = await loginController.login(
                                  usernameController.text,
                                  passwordController.text);
                              if (login.message == 'success') {
                                Navigator.pushReplacementNamed(context, '/home');
                              }
                            } catch (e) {
                              print('error: $e');
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Login Gagal",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ]
                              ).show();
                            }
                          },
                    child: Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  );
                  
                }),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: CustomColor.red,
                //     shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(12),
                //     ),
                //     minimumSize: Size(double.infinity, 48),
                //   ),
                //   onPressed: () {
                //     Navigator.pushReplacementNamed(context, '/home');
                //   },
                //   child: Text(
                //   'Masuk',
                //   style: TextStyle(
                //     color: Colors.white
                //   ),
                // ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}