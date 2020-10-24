import 'package:employee_app/src/core/enums/enum.dart';
import 'package:employee_app/src/core/models/employee.dart';
import 'package:employee_app/src/core/services/databaseServices.dart';
import 'package:employee_app/src/ui/shared/constants.dart';
import 'package:employee_app/src/ui/shared/helper.dart';
import 'package:employee_app/src/ui/views/employeeAddOrEdit.dart';
import 'package:employee_app/src/ui/widgets/messageBox.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  DatabaseServices databaseServices = DatabaseServices();
  List<Employee> employees;

  @override
  void initState() {
    if (employees == null) {
      employees = List<Employee>();
      updateListView();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(CustomSize.appBarHeight),
        child: AppBar(
          title: Text(
            Constants.employeeList.toUpperCase(),
            style: TextStyle(color: Colour.black, fontSize: CustomSize.title),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 4.0, bottom: 6.0, right: 16.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(8.0),
                color: Colour.blue,
                child: Text(
                  Constants.add.toUpperCase(),
                  style: TextStyle(
                      fontSize: CustomSize.content,
                      color: Colour.white,
                      letterSpacing: 0.5),
                ),
                splashColor: Colour.yellow,
                onPressed: _onPressed,
              ),
            )
          ],
          backgroundColor: Colour.white,
          iconTheme: IconThemeData(color: Colour.black),
        ),
      ),
      body: employees.isEmpty
          ? Container(
              child: Center(
                child: Text('Data Empty'),
              ),
            )
          : _buildEmployeeListView(),
    );
  }

  ListView _buildEmployeeListView() {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (BuildContext context, int index) {
        int avatarColor = index % 3;
        print('employee :- ${employees[index].toMap()} :: avatarColor :- $avatarColor');
        return _buildEmployeeCard(employee: employees[index], avatarColor: avatarColor);
      },
    );
  }

  Widget _buildEmployeeCard({@required Employee employee, int avatarColor}) {
    Color color;
    switch(avatarColor) {
      case 0:
        color = Colour.green;
        break;
      case 1:
        color = Colour.blue;
        break;
      case 2:
        color = Colour.yellow;
        break;
      case 3:
        color = Colour.red;
        break;
      case 2:
        color = Colour.silver;
        break;
      default:
        color = Colour.green;
    }
    return Card(
      color: Colour.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text(Helper.getFirstLetterName(
                            name: employee.name ?? "NA")),
                        backgroundColor: color,
                        radius: CustomSize.avatarSize / 2,
                      ),
                      _buildNameWidget(employee: employee),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _buildIcon(
                      icon: Icon(Icons.edit),
                      function: () => _onEditPressed(employee),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    _buildIcon(
                      icon: Icon(Icons.delete),
                      //function: () => _onDeletePressed(context, employee),
                      function: () => MessageBox.createAlertDialog(
                          context: context,
                          msg: 'Are you sure to delete this record.',
                          title: 'DELETE',
                          action: () => _onDeletePressed(context, employee)),
                    )
                  ],
                ),
              ],
            ),
            _divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildText(
                    title: 'CODE', text: 'EMP00${employee.id.toString()}'),
                _buildText(title: 'MOBILE', text: employee.mobile),
              ],
            ),
            _divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildText(title: 'ADDRESS1', text: employee.add1),
              ],
            ),
            _divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildText(title: 'ADDRESS2', text: employee.add2),
              ],
            ),
            _divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildText(title: 'REMARKS', text: employee.remarks),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _divider() {
    return Column(
      children: [
        SizedBox(
          height: 12.0,
        ),
        Container(
          color: Colour.silver,
          height: 0.3,
        ),
        SizedBox(
          height: 12.0,
        ),
      ],
    );
  }

  InkWell _buildIcon({@required Icon icon, @required Function function}) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), border: Border.all()),
        child: icon,
      ),
    );
  }

  Widget _buildText(
      {@required String title, @required String text, int fontSize}) {
    return Text(
      '$title: $text',
      style: TextStyle(
          fontSize: fontSize ?? CustomSize.content,
          letterSpacing: 0.5,
          wordSpacing: 0.8),
    );
  }

  Widget _buildNameWidget({@required Employee employee}) {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${employee.name?.toUpperCase() ?? ""}',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          color: Colour.black,
                          fontSize: CustomSize.content,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('D.O.B: ${employee.date ?? ""}',
                  maxLines: 1,
                  style: TextStyle(
//                          fontFamily: 'Avenir',
                    color: Colour.textHint,
                    fontSize: CustomSize.subTitle,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _onDeletePressed(BuildContext context, Employee employee) async {
    Navigator.pop(context);
    int result = await databaseServices.deleteEmployee(employee.id);
    if (result != 0) {
      Helper.showToast(
          type: 'success', message: 'Employee Deleted Successfully');
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseServices.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Employee>> employeesFuture =
          databaseServices.getEmployeeList();
      employeesFuture.then((employees) {
        setState(() {
          this.employees = employees;
        });
      });
    });
  }

  void _onPressed() async {
    Route route = MaterialPageRoute(
        builder: (context) => EmployeeAddOrEdit(
              operation: Operation.Add,
            ));
    final value = await Navigator.push(context, route);
    print('value :- $value');
    if (value) updateListView();
  }

  void _onEditPressed(Employee employee) {
    Route route = MaterialPageRoute(
      builder: (_) => EmployeeAddOrEdit(
        operation: Operation.Edit,
        employee: employee,
      ),
    );
    Navigator.push(context, route).then((value) {
      print('value :- $value');
      if (value) updateListView();
    });
  }
}
