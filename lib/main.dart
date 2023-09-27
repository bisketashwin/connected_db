// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_views.dart';
import 'theme/my_new_theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// controller
import 'utils/controllers/address_controller.dart';
import 'utils/controllers/commodity_ticket_controller.dart';
import 'utils/controllers/commodity_owner_controller.dart';

/// models
import 'utils/models/commodity_owner_model.dart';
import 'utils/models/address_model.dart';
import 'utils/models/commodity_ticket_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Create dummy commodity tickets only once.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      createDummyCommodityTickets(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add the `const` keyword to the constructor invocation.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: myLightTheme.copyWith(useMaterial3: true),
      darkTheme: myDarkTheme.copyWith(useMaterial3: true),
      initialRoute: AppScreens.INITIAL,
      getPages: AppScreens.routes,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CommodityTicketController>(
            create: (_) => CommodityTicketController()),
        ChangeNotifierProvider<AddressController>(
            create: (_) => AddressController()),
        ChangeNotifierProvider<CommodityOwnerController>(
            create: (_) => CommodityOwnerController()),
      ],
      child: const MyApp(),
    ),
  );
}

class DummyCommodityTicketCreator extends StatelessWidget {
  const DummyCommodityTicketCreator({super.key});

  @override
  Widget build(BuildContext context) {
    // Create dummy commodity tickets.
    createDummyCommodityTickets(context);

    return Container();
  }
}

void createDummyCommodityTickets(BuildContext context) {
  // Get an instance of the CommodityTicketController.
  CommodityTicketController commodityTicketController =
      Provider.of<CommodityTicketController>(context, listen: false);

  // Add the dummy commodity tickets.
  commodityTicketController.addCommodityTicket(CommodityTicket(
    commodityOwner: CommodityOwner(
      firmName: 'Acme Corporation',
      proprietorName: 'Rajesh Fegal',
    ),
    commodity: 'Wheat',
    quantity: '100 MT',
    contactPerson: 'Prakas Kumar Mitra',
    phoneNumber: '76545 45632',
    pickUpAddress: Address(
      firmName: 'Acme Corporation',
      street: 'Sy 79/6, Muppadighatta, Madhure Hobli',
      villageOrTaluk: 'Dodballapur',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '561204',
      googleMapLocation: 'https://maps.app.goo.gl/wJzH77fSxGJ4R7Gw6',
    ),
    destinationAddress: Address(
      firmName: 'Access Warehousing',
      street:
          '4th Block, 37/3, 80 Feet Ring Rd, 4th Block, Stage 1, KHB Colony',
      villageOrTaluk: 'Basaveshwar Nagar',
      zilla: 'Bengaluru City',
      state: 'Karnataka ',
      pincode: '560079',
      googleMapLocation: 'https://maps.app.goo.gl/akW4WghWvEwvZvut6',
    ),
    // pickupDate: dateFormat.parse('30-October-2023 8:00 am'),
    pickupDate: DateTime.parse('2023-10-03 08:00:00Z'),
  ));

  commodityTicketController.addCommodityTicket(CommodityTicket(
    commodityOwner: CommodityOwner(
        firmName: 'MSR Fruits Farm', proprietorName: 'Ujjanagowda Patil'),
    commodity: 'Grapes',
    quantity: '120 MT',
    contactPerson: 'Ramesh Patil',
    phoneNumber: '9632115645',
    pickUpAddress: Address(
      firmName: 'MSR Fruits Farm',
      street: 'Chikka Kukkanahalli, Guddarahalli, hearaghatta',
      villageOrTaluk: 'hearaghatta',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '560089',
      googleMapLocation: 'https://maps.app.goo.gl/aGY9oyaXLxN3jmpa7',
    ),
    destinationAddress: Address(
      firmName: 'Isiri Cold Storage',
      street: 'Sy, 74, 86 & 87, NH-4, Sompura, Industrial Area, Dobbaspet',
      villageOrTaluk: 'Nelamangala',
      zilla: 'Bengaluru Rural',
      state: 'Karnataka',
      pincode: '562111',
      googleMapLocation:
          'https://maps.google.com/?q=123+Main+Street,+San+Francisco,+CA+94105',
    ),
    pickupDate: DateTime.parse('2023-09-27 16:00:00Z'),
    // pickupDate: dateFormat.parse('23-September-2023 12:00 pm'),
  ));
}
