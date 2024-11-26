class SigninRequest {
  String? name;
  String? phoneNumber;
  String? device;
  bool? ispinAgain;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['device'] = device;
    data['ispinAgain'] = ispinAgain;
    return data;
  }
}
