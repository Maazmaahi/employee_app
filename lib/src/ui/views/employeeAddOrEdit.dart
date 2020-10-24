import 'package:employee_app/src/core/enums/enum.dart';
import 'package:employee_app/src/core/models/employee.dart';
import 'package:employee_app/src/core/services/databaseServices.dart';
import 'package:employee_app/src/ui/shared/constants.dart';
import 'package:employee_app/src/ui/shared/validators.dart';
import 'package:employee_app/src/ui/widgets/customDefaultTextFormField.dart';
import 'package:employee_app/src/ui/widgets/transparentScreen.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class EmployeeAddOrEdit extends StatefulWidget {
  final Operation operation;
  final Employee employee;

  EmployeeAddOrEdit({this.operation, this.employee});

  @override
  _EmployeeAddOrEditState createState() => _EmployeeAddOrEditState();
}

class _EmployeeAddOrEditState extends State<EmployeeAddOrEdit> {
  Employee employee;
  Operation operation;
  String title, buttonText, dob;
  DatabaseServices databaseServices = DatabaseServices();

  final _nameFocus = FocusNode();
  final _add1Focus = FocusNode();
  final _add2Focus = FocusNode();
  final _mobileFocus = FocusNode();
  final _remarksFocus = FocusNode();
  final _nameController = TextEditingController();
  final _add1Controller = TextEditingController();
  final _add2Controller = TextEditingController();
  final _mobileController = TextEditingController();
  final _dobController = TextEditingController();
  final _remarksController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false, _isVisiblePassword = false;
  final format = DateFormat("dd / MM / yyy");
  final CustomDefaultTextFormField customDefaultTextFormField =
      CustomDefaultTextFormField();

  @override
  void initState() {
    operation = widget.operation;
    if (operation == Operation.Edit) {
      title = Constants.editEmployee;
      buttonText = Constants.edit;
      employee = widget.employee;
      _nameController.text = employee.name;
      _add1Controller.text = employee.add1;
      _add2Controller.text = employee.add2;
      _mobileController.text = employee.mobile;
      _dobController.text = employee.date;
      _remarksController.text = employee.remarks;
    } else {
      title = Constants.addEmployee;
      buttonText = Constants.save;
      employee = new Employee('','','','','','');
    }

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _nameFocus.dispose();
    _add1Focus.dispose();
    _add2Focus.dispose();
    _mobileFocus.dispose();
    _remarksFocus.dispose();
    _nameController.dispose();
    _add1Controller.dispose();
    _add2Controller.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    _remarksController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => moveToLastScreen(),
      child: _isLoading ? Scaffold(body: TransparentScreenWithLoader()) : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(CustomSize.appBarHeight),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: moveToLastScreen,
          ),
          title: Text(
            '${title?.toUpperCase()}',
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
                  buttonText.toUpperCase(),
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
      body: _buildFormWidget(),
    );
  }

  Widget _buildFormWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: 40),
            CustomDefaultTextFormField(
              placeHolderString: 'Enter Your Name',
              textController: _nameController,
              ownFocusNode: _nameFocus,
              nextFocusNode: _add1Focus,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[A-z a-z]"))
              ],
              validationFunc: Validator.validateEmpty,
            ),
            SizedBox(height: 40),
            CustomDefaultTextFormField(
              placeHolderString: 'Enter Your Address 1',
              textController: _add1Controller,
              ownFocusNode: _add1Focus,
              nextFocusNode: _add2Focus,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              validationFunc: Validator.validateEmpty,
            ),
            SizedBox(height: 40),
            CustomDefaultTextFormField(
              placeHolderString: 'Enter Your Address 2',
              textController: _add2Controller,
              ownFocusNode: _add2Focus,
              nextFocusNode: _mobileFocus,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              validationFunc: Validator.validateEmpty,
            ),
            SizedBox(height: 40),
            CustomDefaultTextFormField(
              placeHolderString: 'Enter Your Mobile Number',
              textController: _mobileController,
              ownFocusNode: _mobileFocus,
              nextFocusNode: _remarksFocus,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]"))
              ],
              validationFunc: Validator.validateMobile,
            ),
            SizedBox(height: 40),
            _buildBasicDate(),
            SizedBox(height: 40),
            CustomDefaultTextFormField(
              placeHolderString: 'Enter Your Remarks',
              textController: _remarksController,
              ownFocusNode: _remarksFocus,
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              validationFunc: Validator.validateEmpty,
              multiLine: 6,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicDate() {
    return DateTimeField(
      controller: _dobController,
      format: format,
      validator: (val) {
        if (val == null && operation == Operation.Add) {
          return "Date Field can't be empty";
        }
        return null;
      },
      decoration: customDefaultTextFormField.getInputDecoration(
          placeHolderString: 'Enter your d.o.b'),
      onShowPicker: (context, currentValue) {
        print('date value :- $currentValue');
        return showDatePicker(
            context: context,
            initialDate: currentValue ?? DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime(2030));
      },
    );
  }

  _onPressed() async {
    print('dob :- ${_dobController.text} :: name : - ${_nameController.text}');
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      employee.name = _nameController.text;
      employee.add1 = _add1Controller.text;
      employee.add2 = _add2Controller.text;
      employee.mobile = _mobileController.text;
      employee.date = _dobController.text;
      employee.remarks = _remarksController.text;
      int result;
      if (operation == Operation.Edit) {
        result = await databaseServices.updateEmployee(employee);
      } else {
        result = await databaseServices.insertEmployee(employee);
      }

      moveToLastScreen();

      if (result != 0) {
        // Success
        _showAlertDialog('Status', 'Employee Saved Successfully');
      } else {
        // Failure
        _showAlertDialog('Status', 'Problem Saving Employee');
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
