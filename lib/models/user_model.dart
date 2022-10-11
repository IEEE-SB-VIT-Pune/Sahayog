class UserModel {
  String? email,
      name,
      uid,
      phone,
      relation,
      emergencyName,
      dob,
      gender,
      medicineName,
      timeOfIntake,
      instructions,
      Dosage1,
      Dosage2,
      Dosage3;
  int? color_id;
  UserModel({
    this.email,
    this.uid,
    this.name,
    this.phone,
    this.relation,
    this.emergencyName,
    this.dob,
    this.gender,
    this.medicineName,
    this.timeOfIntake,
    this.instructions,
    this.Dosage1,
    this.Dosage2,
    this.Dosage3,
  });
  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'],
        name: map['name'],
        phone: map['phone'],
        relation: map['relation'],
        emergencyName: map['emergencyName'],
        dob: map['dob'],
        gender: map['gender']);
  }

  //sending data to server
  Map<String, dynamic> contact() {
    return {
      'emergencyName': emergencyName,
      'phone': phone,
      'relation': relation,
    };
  }

  Map<String, dynamic> thisMap() {
    return {
      'name': name,
      'phone': phone,
      'relation': relation,
      'dob': dob,
      'gender': gender,
    };
  }

  Map<String, dynamic> HealthMap() {
    return {
      'medicineName': medicineName,
      'timeOfIntake': timeOfIntake,
      'Dosage1': Dosage1,
      'Dosage2': Dosage2,
      'Dosage3': Dosage3,
      'instructions': instructions
    };
  }
}
