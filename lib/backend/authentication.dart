// ignore_for_file: unused_local_variable

class Authentication {
  static bool login(String username, String password) {
    const validUsername = 'admin';
    const validPassword = 'admin';

    // Check if the username and password match
    if (username == validUsername && password == validPassword) {
      return true; // Login successful
    } else {
      return false; // Login failed
    }
  }
}