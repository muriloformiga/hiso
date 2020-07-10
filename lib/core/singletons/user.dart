class User {
  User._();

  static final _instance = User._();

  static User get instance => _instance;

  String _userId;
  String _name;
  String _accountType;

  String get userId => _userId;
  String get name => _name;
  String get accountType => _accountType;

  void setId(String id) {
    _userId = id;
  }

  void setName(String name) {
    _name = name;
  }

  void setAccountType(String type) {
    _accountType = type;
  }
}
