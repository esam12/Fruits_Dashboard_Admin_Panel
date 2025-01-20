class ShippingAddressEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? addressDetails;
  String? phoneNumber;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
    this.phoneNumber,
  });

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      address: address,
      city: city,
      addressDetails: addressDetails,
      phoneNumber: phoneNumber,
    );
  }

  // Separate method to display shipping address
  String getAddress() {
    return '$address, $city, $addressDetails';
  }
}
