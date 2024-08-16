import 'package:employee_monitor/screens/profile/profile_controller.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.red,

        title: Text('Profile', style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx((){
                return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    
                    children: [
                      CircleAvatar(
                        child: Image.network('https://avatar.iran.liara.run/public'),
                        radius: 80,
                        
                      ),
                      SizedBox(height: 16.0),
                      Text('${controller.data.value.fullName}',textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),),
                      Text('Jabatan : ${controller.data.value.position ?? '-'}', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 8.0),
                      Text('${controller.data.value.role}', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      
                    ],
                    
                  ),
                ),
              );
              }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.red,
                  elevation: 8,
                  minimumSize: Size(double.infinity, 50)
                ),
                onPressed: ()async{
                  final logout = await controller.deleteToken();
                  if(logout){
                    Get.deleteAll();
                    Get.offAllNamed('/login');
                  }
                }, child: Text('Logout', style: TextStyle(
                color: Colors.white
          
              ),))
            ],
          ),
        ),
      ),
    );
  }
}