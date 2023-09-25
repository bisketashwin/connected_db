import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/commodity_ticket_model.dart';
import 'package:uuid/uuid.dart';

class CommodityTicketController extends ChangeNotifier {
  final List<CommodityTicket> _commodityTickets = [];
  final Uuid _uuid = Uuid();

  List<CommodityTicket> get commodityTickets => _commodityTickets;

  // Add a function to generate a unique ID for a new commodity ticket.
  String generateUniqueId() {
    return _uuid.v4();
  }

  // Add a function to create a new commodity ticket.
  void addCommodityTicket(CommodityTicket commodityTicket) {
    // Set the unique ID for the new commodity ticket.
    commodityTicket.id = generateUniqueId();

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
