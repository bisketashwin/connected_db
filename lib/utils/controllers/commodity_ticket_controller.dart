import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';

class CommodityTicketController extends ChangeNotifier {
  final List<CommodityTicket> _commodityTickets = [];
  final Uuid _uuid = const Uuid();

  List<CommodityTicket> get commodityTickets => _commodityTickets;

  // Add a function to generate a unique ID for a new commodity ticket.
  String generateUniqueId() {
    return _uuid.v4();
  }

  // Add a function to create a new commodity ticket.
  void addCommodityTicket(CommodityTicket commodityTicket) {
    _commodityTickets.add(commodityTicket);
    notifyListeners();
  }

  // Add a function to edit a commodity ticket.
  void editCommodityTicket(CommodityTicket commodityTicket) {
    _commodityTickets[_commodityTickets.indexOf(commodityTicket)] =
        commodityTicket;
    notifyListeners();
  }

  // Add a function to delete a commodity ticket.
  void deleteCommodityTicket(CommodityTicket commodityTicket) {
    _commodityTickets.remove(commodityTicket);
    notifyListeners();
  }
}
