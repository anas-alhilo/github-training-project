class User {
  late int id;
  late String fName;
  late String lName;
  late String email;
  late String password;

  static const String tableName = 'users';
  User();

  // Read
  User.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    fName = rowMap['fname'];
    lName = rowMap['lname'];
    email = rowMap['email'];
    password = rowMap['password'];
  }

  // write
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['fname'] = fName;
    map['lname'] = lName;
    map['email'] = email;
    map['password'] = password;

    return map;
  }
}
