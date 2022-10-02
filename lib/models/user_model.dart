class UserModel {
  String? name, phone, relation;

  UserModel({this.name, this.phone, this.relation});

  factory UserModel.fromMap(map) {
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      relation: map['relation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'relation': relation};
  }
}
