import 'dart:async';
import 'dart:io';

import 'package:employee_app/src/core/models/employee.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  static DatabaseServices _databaseServices;
  static Database _database;

  String employeeTable = 'employee_table';
  String colId = 'id';
  String colName = 'name';
  String colAdd1 = 'add1';
  String colAdd2 = 'add2';
  String colDate = 'date';
  String colMobile = 'mobile';
  String colRemarks = 'remarks';

  DatabaseServices._createInstance();

  factory DatabaseServices() {
    if (_databaseServices == null) {
      _databaseServices = DatabaseServices._createInstance();
    }

    return _databaseServices;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'employee.db';

    var employeeDatabase = await openDatabase(path, version: 1, onCreate: _createDb);

    return employeeDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $employeeTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT,'
        '$colAdd1 TEXT, $colAdd2 TEXT, $colDate TEXT, $colMobile TEXT, $colRemarks TEXT)');
  }

  //  Fetch Operation : Get all audio objects from database.
  Future<List<Map<String, dynamic>>> getEmployeeMapList() async {
    Database db = await this.database;

    // var result = await db.rawQuery('SELECT * FROM $audioTable');
    var result = await db.query(employeeTable, orderBy: '$colId ASC');

    return result;
  }

//  Insert Operation : Insert an audio object to database
  Future<int> insertEmployee(Employee employee) async {
    Database db = await this.database;
    var result = await db.insert(employeeTable, employee.toMap());

    return result;
  }

//  Update operation  : Update an audio object and save it to database
  Future<int> updateEmployee(Employee employee) async {
    Database db = await this.database;
    var result = await db.update(employeeTable, employee.toMap(),
        where: '$colId = ?', whereArgs: [employee.id]);

    return result;
  }

// Delete Operation : Delete an audio object from database
  Future<int> deleteEmployee(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $employeeTable WHERE $colId = $id');

    return result;
  }

//  Get number of audio object in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $employeeTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Employee List' [ List<Employee> ]
  Future<List<Employee>> getEmployeeList() async {

    var employeeMapList = await getEmployeeMapList(); // Get 'Map List' from database
    int count = employeeMapList.length;         // Count the number of map entries in db table

    List<Employee> employees = List<Employee>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      employees.add(Employee.fromMapObject(employeeMapList[i]));
    }

    return employees;
  }
}
