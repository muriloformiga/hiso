class User {
  User._() {
    _userId = 'muriloformiga';
  }

  static final _instance = User._();

  static User get instance => _instance;
  String get userId => _userId;

  void setId(String id) {
    _userId = id;
  }

  String _userId;
}
