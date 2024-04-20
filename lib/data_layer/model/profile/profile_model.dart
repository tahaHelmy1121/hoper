
import 'dart:convert';

ProfileModel profileModelFromMap(String str) => ProfileModel.fromJson(json.decode(str));
class ProfileModel {
  String? id;
  String? customerGroupId;
  String? firstName;
  String? lastName;
  String? userEmail;
  String? mobile;
  String? userName;
  String? regionId;
  String? userActive;
  String? image;
  String? userRegistrationDatetime;
  String? newsletter;
  int? defaultAddressId;
  String? userPasswordHash;
  int? sId;
  Null? code;

  ProfileModel(
      {this.id,
        this.customerGroupId,
        this.firstName,
        this.lastName,
        this.userEmail,
        this.mobile,
        this.userName,
        this.regionId,
        this.userActive,
        this.image,
        this.userRegistrationDatetime,
        this.newsletter,
        this.defaultAddressId,
        this.userPasswordHash,
        this.sId,
        this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerGroupId = json['customer_group_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userEmail = json['user_email'];
    mobile = json['mobile'];
    userName = json['user_name'];
    regionId = json['region_id'];
    userActive = json['user_active'];
    image = json['image'];
    userRegistrationDatetime = json['user_registration_datetime'];
    newsletter = json['newsletter'];
    defaultAddressId = json['default_address_id'];
    userPasswordHash = json['user_password_hash'];
    sId = json['s_id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_group_id'] = this.customerGroupId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_email'] = this.userEmail;
    data['mobile'] = this.mobile;
    data['user_name'] = this.userName;
    data['region_id'] = this.regionId;
    data['user_active'] = this.userActive;
    data['image'] = this.image;
    data['user_registration_datetime'] = this.userRegistrationDatetime;
    data['newsletter'] = this.newsletter;
    data['default_address_id'] = this.defaultAddressId;
    data['user_password_hash'] = this.userPasswordHash;
    data['s_id'] = this.sId;
    data['code'] = this.code;
    return data;
  }
}