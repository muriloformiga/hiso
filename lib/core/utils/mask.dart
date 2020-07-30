extension Mask on String {
  bool get isHealthNumberValid {
    final healthNumberRegex = RegExp(
      r'([7])(\d{2})(\s\d{4})(\s\d{4})(\s\d{4})',
    );
    return _verifyMatch(healthNumberRegex);
  }

  bool get isDateValid {
    final dateRegex = RegExp(r'(\d{2})/(\d{2})/(\d{4})');
    return _verifyMatch(dateRegex);
  }

  bool get isEmailValid {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    return _verifyMatch(emailRegex);
  }

  bool _verifyMatch(RegExp regex) {
    if (this == null) {
      return false;
    }
    if (regex.hasMatch(this)) {
      return true;
    }
    return false;
  }
}
