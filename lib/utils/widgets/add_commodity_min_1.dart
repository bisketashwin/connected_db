import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material3_app/utils/models/models.dart';
import 'package:material3_app/utils/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../app_routes.dart';
import '../commonactions/common_actions.dart';

class addCommodityMin1 extends StatefulWidget {
  final List<CommodityTicket> commodityTickets;
  final int index;

  const addCommodityMin1({
    Key? key,
    required this.commodityTickets,
    required this.index,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<addCommodityMin1> {
  late List<CommodityTicket> commodityTickets = widget.commodityTickets;
  late int index = widget.index;
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    return addCommDetails(context, this);
  }

  Widget addCommDetails(context, state) {
    /////////////////

    List<CommodityTicket> commodityTickets =
        Provider.of<CommodityTicketController>(context).commodityTickets;
    int index = state.index;
    List<FarmAddress> farmAddresses =
        Provider.of<FarmAddressController>(context).farmAddresses;
    List<WarehouseAddress> warehouseAddresses =
        Provider.of<WarehouseAddressController>(context).warehouseAddresses;
    List<CommodityOwner> commodityOwners =
        Provider.of<CommodityOwnerController>(context).commodityOwners;
    List<User> users = Provider.of<UserController>(context).users;

    var commodityTicket = commodityTickets[index];

    var ownerId = commodityTicket.commodityOwnerId;
    var pickupId = commodityTicket.pickUpAddressId;
    var destId = commodityTicket.destinationAddressId;
    var userId = commodityTicket.destinationAddressId;

    CommodityOwner comOwner = commodityOwners
        .firstWhere((commodityOwner) => commodityOwner.id == ownerId);
    FarmAddress pickAd =
        farmAddresses.firstWhere((address) => address.id == pickupId);
    WarehouseAddress destAd =
        warehouseAddresses.firstWhere((address) => address.id == destId);
    User user = users.firstWhere((user) => user.id == userId);

    ///////////
    var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
    var defaultTextStyle = Theme.of(context).textTheme.bodySmall;

    return Center(
      child: InkWell(
        onTap: () {
          // showDetails = !showDetails;
          // debugPrint('showDetails = $showDetails');
          // setState(() {});

          // this is getX implementation
          Get.toNamed(Routes.ADD_COMM_DETAILS, arguments: {
            'index': index,
          });
        },
        child: Card(
          child: Column(
            children: [
              topBannerStatus(
                goodMovement: commodityTicket.goodMovement,
                context: context,
                status: commodityTicket.status,
                timeString: DateFormat('  d MMM yyyy')
                    .format(commodityTicket.pickupDate),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 15, top: 5),
                  child: Column(children: [
                    DefaultTextStyle(
                        style: defaultTextStyle!,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(children: [
                                    getGcommodityThumb(
                                        name: commodityTicket.commodity),
                                  ]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${commodityTicket.commodity}  ${commodityTicket.quantity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text('Owner: ${comOwner.firmName}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Row(children: [
                                        iconLabel(
                                          context: context,
                                          mainText:
                                              commodityTicket.ticketNumber,
                                          textSize: 'bodyMedium',
                                          color: color1,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        iconLabel(
                                          context: context,
                                          mainText:
                                              '${commodityTicket.transportType} Transport',
                                          textSize: 'bodyMedium',
                                          color: color1,
                                          type: 'Transport',
                                        )
                                      ])
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),
                              Text(
                                'Pick up - ${pickAd.firmName}, ${pickAd.villageOrTaluk}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Divider(),
                              Visibility(
                                  visible: !showDetails,
                                  child: Text(
                                    'Destination - ${destAd.firmName}, ${destAd.villageOrTaluk}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ))
                            ]))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
