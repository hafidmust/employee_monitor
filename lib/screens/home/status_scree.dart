import 'package:flutter/material.dart';

class StatusGridScreen extends StatelessWidget {
  final List<StatusItem> items = [
    StatusItem(title: 'Pending', color: Colors.orange, icon: Icons.pending_actions),
    StatusItem(title: 'Approved', color: Colors.green, icon: Icons.check_circle),
    StatusItem(title: 'Rejected', color: Colors.red, icon: Icons.cancel),
  ];

  StatusGridScreen({super.key});

  // const StatusGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class StatusItem {
  final String title;
  final Color color;
  final IconData icon;

  StatusItem({required this.title, required this.color, required this.icon});
}