import 'package:employee_app/src/ui/views/employeeList.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String route = "/home";

  @override
  Widget build(BuildContext context) {
    return EmployeeList();
  }

  Scaffold _buildScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      //child: EmployeeList(),
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}
