import 'package:get/get.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  final List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  void addAddress(Address address) {
    _addresses.add(address);
    update();
  }

  void modifyAddress(Address oldAddress, Address newAddress) {
    _addresses[_addresses.indexOf(oldAddress)] = newAddress;
    update();
  }

  void deleteAddress(Address address) {
    _addresses.remove(address);
    update();
  }
}
