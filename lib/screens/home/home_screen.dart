import 'package:employee_monitor/widget/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
              child: Text("Welcome, Admin",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            LayoutGrid(
              columnSizes: [1.fr, 1.fr],
              rowSizes: [auto, auto, auto],
              rowGap: 10,
              columnGap: 10,
              children: [
                _buildGridCard("8", 'Pending', Colors.orange)
                    .withGridPlacement(columnStart: 0, rowStart: 0, rowSpan: 2),
                _buildGridCard("20", 'Acc', Colors.green)
                    .withGridPlacement(columnStart: 1, rowStart: 0),
                _buildGridCard("1", 'Reject', Colors.red)
                    .withGridPlacement(columnStart: 1, rowStart: 1),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Menu', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Row(
              children: [
                CircleIconButton(icon: Icons.note_add, text: "Laporan", color: Colors.red, onPressed: (){
                  Navigator.pushNamed(context, '/add_laporan');
                }),
                SizedBox(width: 32.0,),
                CircleIconButton(icon: Icons.add_task, text: "Tugas", color: Colors.red, onPressed: (){
                  Navigator.pushNamed(context, '/add_tugas');
                }),
                SizedBox(width: 32.0,),
                CircleIconButton(icon: Icons.format_list_bulleted, text: "List Report", color: Colors.red, onPressed: (){
                  Navigator.pushNamed(context, '/list_validation');
                }),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

Widget _buildGridCard(String count, String title, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: TextStyle(
              color: Colors.white,
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
