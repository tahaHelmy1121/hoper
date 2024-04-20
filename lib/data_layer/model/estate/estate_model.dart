import 'dart:convert';

List<AddressModel> CustomerAddressModelModelRouteFromMap(String str) =>
    List<AddressModel>.from(
        json.decode(str).map((x) => AddressModel.fromJson(x)));

class AddressModel {
  var id;
  var addressFirstName;
  var addressLastName;
  var addressEmail;
  var addressMobile;
  var addressCompany;
  var addressAddress1;
  var addressAddress2;
  var addressCity;
  var addressPostCode;
  var countryId;
  var regionId;
  var countryName;
  var regionName;
  var customerId;
  var mobile;

  AddressModel(
      {this.id,
      this.addressFirstName,
      this.addressLastName,
      this.addressEmail,
      this.addressMobile,
      this.addressCompany,
      this.addressAddress1,
      this.addressAddress2,
      this.addressCity,
      this.addressPostCode,
      this.countryId,
      this.regionId,
      this.countryName,
      this.regionName,
      this.customerId,
      this.mobile});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressFirstName = json['address_first_name'];
    addressLastName = json['address_last_name'];
    addressEmail = json['address_email'];
    addressMobile = json['address_mobile'];
    addressCompany = json['address_company'];
    addressAddress1 = json['address_address_1'];
    addressAddress2 = json['address_address_2'];
    addressCity = json['address_city'];
    addressPostCode = json['address_post_code'];
    countryId = json['country_id'];
    regionId = json['region_id'];
    countryName = json['country_name'];
    regionName = json['region_name'];
    customerId = json['customer_id'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_first_name'] = this.addressFirstName;
    data['address_last_name'] = this.addressLastName;
    data['address_email'] = this.addressEmail;
    data['address_mobile'] = this.addressMobile;
    data['address_company'] = this.addressCompany;
    data['address_address_1'] = this.addressAddress1;
    data['address_address_2'] = this.addressAddress2;
    data['address_city'] = this.addressCity;
    data['address_post_code'] = this.addressPostCode;
    data['country_id'] = this.countryId;
    data['region_id'] = this.regionId;
    data['country_name'] = this.countryName;
    data['region_name'] = this.regionName;
    data['customer_id'] = this.customerId;
    data['mobile'] = this.mobile;
    return data;
  }
}
