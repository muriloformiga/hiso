class User {
  User._();

  static final _instance = User._();

  static User get instance => _instance;

  String _userId;
  String _email;
  String _name;
  String _lastName;
  String _cpf;
  String _accountType;
  String _phone;
  String _code;

  String get userId => _userId;
  String get email => _email;
  String get name => _name;
  String get lastName => _lastName;
  String get cpf => _cpf;
  String get accountType => _accountType;
  String get phone => _phone;
  String get code => _code;

  void setId(String id) {
    _userId = id;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setName(String name) {
    _name = name;
  }

  void setLastName(String lastName) {
    _lastName = lastName;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  void setPhone(String phone) {
    _phone = phone;
  }

  void setAccountType(String type) {
    _accountType = type;
  }

  void setCode(String code) {
    _code = code;
  }
}
