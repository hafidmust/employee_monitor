import 'package:employee_monitor/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  
                  children: [
                    CircleAvatar(

                      radius: 80,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(height: 16.0),
                    Text('Nama: John Doe',textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('NIP : 098678777', textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),),
                    
                  ],
                  
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.red,
                elevation: 8,
                minimumSize: Size(double.infinity, 50)
              ),
              onPressed: (){}, child: Text('Logout', style: TextStyle(
              color: Colors.white

            ),))
          ],
        ),
      ),
    );
  }
}