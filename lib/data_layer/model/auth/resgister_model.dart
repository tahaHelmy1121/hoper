class RegisterModel {
  int? status;
  String? reason;
  int? userId;
  String? userName;
  String? userEmail;
  String? firstName;
  String? lastName;
  int? groupId;
  String? profile;

  RegisterModel(
      {this.status,
        this.reason,
        this.userId,
        this.userName,
        this.userEmail,
        this.firstName,
        this.lastName,
        this.groupId,
        this.profile});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    groupId = json['group_id'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['group_id'] = this.groupId;
    data['profile'] = this.profile;
    return data;
  }
}