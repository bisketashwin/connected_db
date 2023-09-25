import 'package:get/get.dart';
import '../models/commodity_ticket_model.dart';
import 'package:uuid/uuid.dart';

class CommodityTicketController extends GetxController {
  final List<CommodityTicket> _commodityTickets = [];
  final uuid = Uuid();

  List<CommodityTicket> get commodityTickets => _commodityTickets;

  // Add a function to generate a unique ID for a new commodity ticket.
  String generateUniqueId() {
    // TODO: Implement a function to generate a unique ID.
    String id = uuid.v4();
    return id;
  }

  // Add a function to create a new commodity ticket.
  void addCommodityTicket(CommodityTicket commodityTicket) {
    // Set the unique ID for the new commodity ticket.
    commodityTicket.id = generateUniqueId();

    _commodityTickets.add(commodityTicket);
    update();
  }

  // Add a function to edit a commodity ticket.
  void editCommodityTicket(CommodityTicket commodityTicket) {
    _commodityTickets[_commodityTickets.indexOf(commodityTicket)] =
        commodityTicket;
    update();
  }

  // Add a function to delete a commodity ticket.
  void deleteCommodityTicket(CommodityTicket commodityTicket) {
    _commodityTickets.remove(commodityTicket);
    update();
  }
}
