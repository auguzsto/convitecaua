class ConfirmedModel {
  int? id;
  String? name;
  String? phone;

  ConfirmedModel({
    this.id,
    this.name,
    this.phone,
  });

  factory ConfirmedModel.fromMap(Map<String, dynamic> map) {
    return ConfirmedModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
    };
  }
}
