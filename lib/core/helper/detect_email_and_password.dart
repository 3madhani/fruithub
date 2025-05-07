class DetectEmailAndPassword {
  static bool isValidEmail(String email) {
    // Check if the email is empty
    if (email.isEmpty) {
      return false;
    }
    // Regular expression for validating an Email
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    // Check if the email matches the pattern
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    // Check if the password is empty
    if (password.isEmpty) {
      return false;
    }
    // Password must be at least 8 characters long and contain at least one number
    String pattern = r'^(?=.*[0-9]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }
}