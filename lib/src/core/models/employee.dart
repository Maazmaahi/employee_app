class Employee {
  int _id;
  String _name;
  String _add1;
  String _add2;
  String _date;
  String _mobile;
  String _remarks;

  Employee(this._name, this._add1, this._add2, this._date, this._mobile, this._remarks);

  Employee.withId(this._id, this._name, this._add1, this._add2, this._date, this._mobile, this._remarks);

  int get id => _id;

  String get name => _name;

  String get add1 => _add1;

  String get add2 => _add2;

  String get date => _date;

  String get mobile => _mobile;

  String get remarks => _remarks;

  set name(String newName) {
    print('name in setter :- $newName');
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set add1(String newAdd1) {
    if (newAdd1.length <= 255) {
      this._add1 = newAdd1;
    }
  }

  set add2(String newAdd2) {
    if (newAdd2.length <= 255) {
      this._add2 = newAdd2;
    }
  }

  set date(String newDate) {
    if (newDate.length <= 255) {
      this._date = newDate;
    }
  }

  set mobile(String newMobile) {
    if (newMobile.length <= 255) {
      this._mobile = newMobile;
    }
  }

  set remarks(String newRemarks) {
    if (newRemarks.length <= 255) {
      this._remarks = newRemarks;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['add1'] = _add1;
    map['add2'] = _add2;
    map['date'] = _date;
    map['mobile'] = _mobile;
    map['remarks'] = _remarks;

    return map;
  }

  Employee.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._add1 = map['add1'];
    this._add2 = map['add2'];
    this._date = map['date'];
    this._mobile = map['mobile'];
    this._remarks = map['remarks'];
  }
}
