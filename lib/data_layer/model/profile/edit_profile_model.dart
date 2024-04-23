class UpdateProfile {
  int? status;
  String? reason;
  String? userName;
  String? userEmail;
  String? firstName;
  String? lastName;
  int? mobile;

  UpdateProfile(
      {this.status,
        this.reason,
        this.userName,
        this.userEmail,
        this.firstName,
        this.lastName,
        this.mobile});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    return data;
  }
}