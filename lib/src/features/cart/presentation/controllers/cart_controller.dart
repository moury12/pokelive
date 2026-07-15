import 'package:flutter_riverpod/legacy.dart';

class Address {
  final String name;
  final String phone;
  final String street;
  final String city;

  const Address({
    required this.name,
    required this.phone,
    required this.street,
    required this.city,
  });
}

final selectedAddressProvider = StateProvider<Address?>((ref) => const Address(
  name: 'Nm Sujon',
  phone: '0125585823',
  street: '39 Thistle Street',
  city: 'Edinburgh',
));
