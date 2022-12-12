class Passwords {
  String password;
  String confirmPassword;
  int length;

  Passwords([this.password = "", this.confirmPassword = "", this.length = 8]);

  bool nonEmpty() {
    return password.isNotEmpty && confirmPassword.isNotEmpty;
  }

  bool match() {
    return password == confirmPassword;
  }

  bool valid() {
    return password.length >= length;
  }
}
