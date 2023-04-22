class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? age;
  String? classe;
  String? email;

  UserModel({this.uid, this.firstName, this.lastName, this.email, this.age, this.classe});

  //receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      classe: map['classe']
    );
  }

  //send data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'classe': classe
    };
  }

}