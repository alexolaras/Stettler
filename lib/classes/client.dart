class Address {
  int number;
  String street;
  String additionalAddress;
  String postalCode;
  String doorCode;
  String city;
  String statisticCode;

  Address(
      {required this.number,
      required this.street,
      this.additionalAddress = "",
      required this.postalCode,
      required this.doorCode,
      required this.city,
      required this.statisticCode});
}

class Client {
  String name;
  String surname;
  String id;
  String email;
  String phoneNumber;
  Address address;

  Client(
      {required this.name,
      required this.surname,
      required this.id,
      required this.email,
      required this.address,
      required this.phoneNumber});
}
