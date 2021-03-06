import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
}


Future<void>initializeParse()async{
  await Parse().initialize(
    "6OXnPoyNAtdzHhbZl6OK9yPyVfBew08UYm4lwgcj",
    "https://parseapi.back4app.com/",
    clientKey: "NEjAxPkz7GEnNbZ3UEqFjszoCvsYqZDtpJ7Nlb1u",
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'XLO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.purple,
            appBarTheme: AppBarTheme(
            elevation: 0,
        ),
          cursorColor: Colors.orange
        ),
        home: BaseScreen()
    );
  }
}
