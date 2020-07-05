class User {
  User._privateConstructor();
  static final User _instance = User._privateConstructor();
  static User get instance => _instance;

  factory User() {
    return _instance;
  }

  static String _userId;
  String get userId => _userId;
  set userId(String id) => _userId;
}
