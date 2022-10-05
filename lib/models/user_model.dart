class UserModel {
  String? email, name, uid, phone, dob, gender;
  // int? color_id;
  UserModel(
      {this.email, this.uid, this.name, this.phone, this.dob, this.gender});
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'],
        name: map['name'],
        phone: map['phone'],
        dob: map['dob'],
        gender: map['gender']);
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'dob': dob,
      'gender': gender
    };
  }
}
