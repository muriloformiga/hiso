class User {
  User._();

  static final _instance = User._();

  static User get instance => _instance;

  String _userId;
  String _name;
  String _accountType;
  String _phone;

  String get userId => _userId;
  String get name => _name;
  String get accountType => _accountType;
  String get phone => _phone;

  void setId(String id) {
    _userId = id;
  }

  void setName(String name) {
    _name = name;
  }

  void setPhone(String phone) {
    _phone = phone;
  }

  void setAccountType(String type) {
    _accountType = type;
  }
}
