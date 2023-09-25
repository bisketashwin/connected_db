import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:material3_app/theme/custom_color.dart';

// import '../utils/bottom_navigation.dart';
import '../utils/controllers/commodity_ticket_controller.dart';
import '../utils/models/commodity_ticket_model.dart';
import '../utils/widgets.dart';

class Tab2 extends StatefulWidget {
  final String title;
  final CommodityTicketController? commodityTicketController;

  const Tab2({Key? key, required this.title, this.commodityTicketController})
      : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    final commodityTicketController = Get.find<CommodityTicketController>();

    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColors>()!.sourceCustomcolor1,
      body: GetBuilder<CommodityTicketController>(
        builder: (controller) {
          return ListView(
            children: controller.commodityTickets.map((commodityTicket) {
              return CommodityTicketWidget(commodityTicket: commodityTicket);
            }).toList(),
          );
        },
      ),
    );
  }
}

class CommodityTicketWidget extends StatelessWidget {
  final CommodityTicket commodityTicket;

  const CommodityTicketWidget({Key? key, required this.commodityTicket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(commodityTicket.commodity),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
