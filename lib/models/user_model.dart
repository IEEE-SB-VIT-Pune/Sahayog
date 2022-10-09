class UserModel {
  String? email, name, uid, phone, relation, emergencyName;
  int? color_id;
  UserModel(
      {this.email,
      this.uid,
      this.name,
      this.phone,
      this.relation,
      this.emergencyName});
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'],
        name: map['name'],
        phone: map['phone'],
        relation: map['relation'],
        emergencyName: map['emergencyName']);
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  Map<String, dynamic> thisMap() {
    return {
      'name': name,
      'phone': phone,
      'relation': relation,
      'emergencyName': emergencyName
    };
  }
}
