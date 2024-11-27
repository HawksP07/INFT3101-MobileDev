// ignore_for_file: unused_local_variable

class Authentication {
  static bool login(String username, String password) 
  {
    const validUsername = 'admin';
    const validPassword = 'admin';
    if (username == validUsername && password == validPassword) {return true;}  else {return false;}
  }
}