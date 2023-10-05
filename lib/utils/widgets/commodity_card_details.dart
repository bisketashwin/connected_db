import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material3_app/utils/controllers/controllers.dart';
import 'package:material3_app/utils/models/address_model.dart';
import 'package:material3_app/utils/models/commodity_owner_model.dart';
import 'package:material3_app/utils/widgets/widgets.dart';
import 'package:provider/provider.dart';

Widget commodityCardDetails(context, commodityTickets, index) {
  /////////////////
  List<Address> farmAddresses =
      Provider.of<FarmAddressController>(context).addresses;
  List<Address> warehouseAddresses =
      Provider.of<WarehouseAddressController>(context).addresses;
  List<CommodityOwner> commodityOwners =
      Provider.of<CommodityOwnerController>(context).commodityOwners;

  var commodityTicket = commodityTickets[index];

  var ownerId = commodityTicket.commodityOwnerId;
  var pickupId = commodityTicket.pickUpAddressId;
  var destId = commodityTicket.destinationAddressId;

  bool showDetails = false;
  CommodityOwner comOwner = commodityOwners
      .firstWhere((commodityOwner) => commodityOwner.id == ownerId);
  Address pickAd =
      farmAddresses.firstWhere((address) => address.id == pickupId);
  Address destAd =
      warehouseAddresses.firstWhere((address) => address.id == destId);

  ///////////
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  var defaultTextStyle = Theme.of(context).textTheme.bodySmall;

  return Center(
    child: GestureDetector(
      onDoubleTap: () {
        showDetails = !showDetails;
        debugPrint('showDetails = $showDetails');
      },
      child: Card(
        child: Column(
          children: [
            topBannerStatus(context, 1),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 5),
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: defaultTextStyle!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nothing to Show! ${farmAddresses.length}'),
                        iconLabel(
                          label: 'Ticket Number',
                          context: context,
                          mainText: commodityTicket.ticketNumber,
                          textSize: 'bodyMedium',
                          color: color1,
                        ),
                        Text(
                          '${commodityTicket.commodity}  ${commodityTicket.quantity}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(comOwner.firmName,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Visibility(
                          visible: showDetails,
                          child: Text(
                              'Job Created by \n${commodityTicket.contactPerson} ( ${commodityTicket.phoneNumber} )'),
                        ),
                        const Divider(),
                        Text(
                          'Pick up point - ${pickAd.villageOrTaluk}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          DateFormat('h:mm a  --  d MMM yyyy')
                              .format(commodityTicket.pickupDate),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: color1),
                        ),
                        iconLabel(
                          label: 'Transport Provided by',
                          type: 'Transport',
                          context: context,
                          mainText: commodityTicket.transportType,
                          textSize: 'bodyMedium',
                          color: color1,
                        ),
                        Text(pickAd.firmName),
                        Text(pickAd.street),
                        // Text(pickAd.villageOrTaluk),
                        Text(
                            '${pickAd.zilla}, ${pickAd.state} - ${pickAd.pincode}'),
                        //Text(pickAd.state),

                        const Divider(),
                        Text(
                          'Destination - ${destAd.villageOrTaluk}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(destAd.firmName),
                        Text(destAd.street),
                        // Text(destAd.villageOrTaluk),
                        Text(
                            '${destAd.zilla}, ${destAd.state} -${destAd.pincode}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
