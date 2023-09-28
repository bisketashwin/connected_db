// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_views.dart';
import 'theme/my_new_theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// controller
import 'utils/controllers/controllers.dart';

/// models
import 'utils/pre_created_data/commodity_tickets/commodity_tickets.dart';

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
  commodityTicketController.addCommodityTicket(commodityTicket1());
  commodityTicketController.addCommodityTicket(commodityTicket2());
  commodityTicketController.addCommodityTicket(commodityTicket3());
  commodityTicketController.addCommodityTicket(commodityTicket4());
}
