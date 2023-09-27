import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
import '../models/commodity_ticket_model.dart';
import 'package:uuid/uuid.dart';

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
    // Set the unique ID for the new commodity ticket.
    commodityTicket.id = generateUniqueId();
    commodityTicket.ticketNumber = generateTicketNumber(commodityTicket);

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

  // Add a function to generate a unique 5-digit ticket number for a firm with a 3-letter prefix.
  String generateTicketNumber(CommodityTicket commodityTicket) {
    // Get the short form of the firm name.
    String firmName = commodityTicket.commodityOwner.firmName;

    String firmShortName =
        commodityTicket.commodityOwner.firmName.substring(0, 3).toUpperCase();

    // Get the next available ticket number.
    int nextTicketNumber = _commodityTickets
            .where((ticket) => ticket.commodityOwner.firmName == firmName)
            .length +
        1;

    // Generate the ticket number.
    String ticketNumber =
        '$firmShortName-${nextTicketNumber.toString().padLeft(5, '0')}';

    return ticketNumber;
  }
}
