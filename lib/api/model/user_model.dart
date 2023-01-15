class userModel {
  late String firstname;
  late String lastname;
  late String email;
  late String password;
  late String id;
  late String Mobile_number;
  late String wallet;

  userModel(this.lastname, this.firstname, this.email, this.password,
      this.Mobile_number, this.id,this.wallet);

  userModel.fromJson(Map<String, dynamic> map) {
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
    this.email = map['email'];
    this.Mobile_number = map['mobile_number'];
     this.id = map['userID'].toString();
    this.password = map['password'];
     this.wallet=map['wallet'];
  }
}
