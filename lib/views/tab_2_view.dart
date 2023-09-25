import 'package:flutter/material.dart';
import 'package:material3_app/theme/custom_color.dart';
import '../utils/controllers/commodity_ticket_controller.dart';
import '../utils/models/commodity_ticket_model.dart';
import 'package:provider/provider.dart';

class Tab2 extends StatefulWidget {
  final String title;

  const Tab2({Key? key, required this.title}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    List<CommodityTicket> commodityTickets =
        Provider.of<CommodityTicketController>(context).commodityTickets;
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColors>()!.sourceCustomcolor1,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: commodityTickets.length,
          itemBuilder: (context, index) {
            // return Text(commodityTickets[index].companyName);
            return CommodityTicketCard(commodityTickets, index);
          },
        ),
      ),
    );
  }
}

Widget CommodityTicketCard(commodityTickets, index) {
  var commodityTicket = commodityTickets[index];
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${commodityTicket.commodity} Quantity ${commodityTicket.quantity}'),
          Text(commodityTicket.companyName),
          Text(commodityTicket.contactPerson),
          Text(commodityTicket.phoneNumber),
          Text(commodityTicket.pickUpAddress.firmName),
          Text(commodityTicket.pickUpAddress.street),
          Text(commodityTicket.pickUpAddress.villageOrTaluk),
          Text(commodityTicket.pickUpAddress.zilla),
          Text(commodityTicket.pickUpAddress.state),
          Text(commodityTicket.pickUpAddress.pincode),
          Text(commodityTicket.destinationAddress.firmName),
          Text(commodityTicket.destinationAddress.street),
          Text(commodityTicket.destinationAddress.villageOrTaluk),
          Text(commodityTicket.destinationAddress.zilla),
          Text(commodityTicket.destinationAddress.state),
          Text(commodityTicket.destinationAddress.pincode),
          Text(commodityTicket.pickupDate.toString()),
        ],
      ),
    ),
  );
}
