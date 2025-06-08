class DetectEmailAndPassword {
  static bool isValidEmail(String email) {
    // Check if the email is empty
    if (email.isEmpty) {
      return false;
    }
    // Regular expression for validating an Email
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    // Check if the email matches the pattern
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password.isEmpty) return false;

    String pattern =
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }
}
