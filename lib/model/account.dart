class Account {
  String? id;
  String? password;
  bool? typeId;

  Account({this.id, this.password, this.typeId});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    typeId = json['typeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['typeId'] = typeId;
    return data;
  }
}