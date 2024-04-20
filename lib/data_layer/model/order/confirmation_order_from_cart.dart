class ConfirmationOrderFromCart {
  int? status;
  String? reason;
  int? id;

  ConfirmationOrderFromCart({this.status, this.reason, this.id});

  ConfirmationOrderFromCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['id'] = this.id;
    return data;
  }
}