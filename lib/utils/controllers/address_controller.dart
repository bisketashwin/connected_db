import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/address_model.dart';

class AddressController extends ChangeNotifier {
  final List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  void addAddress(Address address) {
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
