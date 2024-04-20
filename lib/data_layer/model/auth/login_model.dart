class LoginModel {
  int? status;
  String? reason;
  int? userId;
  Profile? profile;

  LoginModel({this.status, this.reason, this.userId, this.profile});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    userId = json['user_id'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['user_id'] = this.userId;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? userEmail;
  int? mobile;
  int? groupId;
  String? image;

  Profile(
      {this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.userEmail,
        this.mobile,
        this.groupId,
        this.image});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    mobile = json['mobile'];
    groupId = json['group_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['mobile'] = this.mobile;
    data['group_id'] = this.groupId;
    data['image'] = this.image;
    return data;
  }
}