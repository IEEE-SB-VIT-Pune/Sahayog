class UserModel {
  String? email,
      name,
      uid,
      phone,
      relation,
      emergencyName,
      dob,
      mob,
      yob,
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
    this.mob,
    this.yob,
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
      // relation: map['relation'],
      emergencyName: map['emergencyName'],
      dob: map['dob'],
      mob: map['mob'],
      yob: map['yob'],
      gender: map['gender'],
      medicineName: map['medicineName'],
      timeOfIntake: map['timeOfIntake'],
      Dosage1: map['Dosage1'],
      Dosage2: map['Dosage2'],
      Dosage3: map['Dosage3'],
      instructions: map['instructions'],
    );
  }

  //sending data to server
  Map<String, dynamic> contactMap() {
    return {
      'emergencyName': emergencyName,
      'phone': phone,
    };
  }

  Map<String, dynamic> userMap() {
    return {
      'name': name,
      'phone': phone,
      'dob': dob,
      'mob': mob,
      'yob': yob,
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
