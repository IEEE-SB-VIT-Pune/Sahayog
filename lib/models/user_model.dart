class UserModel {
  String? email, name,  uid;
  int? color_id;
  UserModel(
      {this.email,
      this.uid,
      this.name,
      });
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
     
    );
  }

  //sending data to server
 Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    }  ; 
  }
}
