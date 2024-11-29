class User {
  late String username;
  late String password;
  // num mcScore;
  // num saScore;

  User(
    this.username, 
    this.password, 
    // this.mcScore, 
    // this.saScore
  );

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    // mcScore = json['mcScore'];
    // saScore = json['saScore'];
  }
}