//address_controller.dart
import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
import '../models/address_model.dart';

class WarehouseAddressController extends ChangeNotifier {
  final List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  // Add a function to generate a nickname from the company name.
  String generateNicknameFromCompanyName(Address address) {
    String firmName = address.firmName;
    return firmName.substring(0, 3).toUpperCase();
  }

  void addAddress(Address address) {
    // Generate a nickname from the company name.
    address.nickName = generateNicknameFromCompanyName(address);
    _addresses.add(address);
    notifyListeners();
  }

  void modifyAddress(Address oldAddress, Address newAddress) {
    _addresses[_addresses.indexOf(oldAddress)] = newAddress;
    notifyListeners();
  }

  void deleteAddress(Address address) {
    _addresses.remove(address);
    notifyListeners();
  }
}
