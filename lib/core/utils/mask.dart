extension Mask on String {
  bool get hasMaskOfSusNumber {
    final susNumber = RegExp(r'([7])(\d{2})(\s\d{4})(\s\d{4})(\s\d{4})');
    if (this == null) {
      return false;
    }
    if (susNumber.hasMatch(this)) {
      return true;
    }
    return false;
  }
}
