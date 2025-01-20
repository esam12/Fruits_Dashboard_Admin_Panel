
class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? addressDetails;
  String? phoneNumber;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
    this.phoneNumber,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
      'phoneNumber': phoneNumber,
    };
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      addressDetails: json['addressDetails'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  // Separate method to display shipping address
  String getAddress() {
    return '$address, $city, $addressDetails';
  }
}
