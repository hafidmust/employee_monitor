import 'package:employee_monitor/screens/history/kegiatan/kegiatan_screen.dart';
import 'package:employee_monitor/screens/history/laporan/laporan_screen.dart';
import 'package:employee_monitor/utils/colors.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.red,
        title: Text('History', style: TextStyle(
          color: Colors.white
        ),),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          tabs: [
            Tab(text: 'Laporan',),
            Tab(text: 'Kegiatan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LaporanScreen(),
          KegiatanScreen(),
        ],
      )
    );
  }
}