import 'package:chit_app/screens/all_chitti/view_model/all_chitti_provider.dart';
import 'package:chit_app/screens/login/view_model/login_provider.dart';
import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:chit_app/screens/splash_screen/view/spalsh_screen.dart';
import 'package:chit_app/screens/splash_screen/view_model/splash_provider.dart';
import 'package:chit_app/screens/take_chitti/view_model/take_chit_provider.dart';
import 'package:chit_app/screens/user_info/view_model/user_info_provider.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/global/view_model/global_provider.dart';
import 'screens/registration/view_model/registration_provider.dart';
import 'screens/user_info/model/user_chitti_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(RegistrationModelAdapter().typeId)) {
    Hive.registerAdapter(
      RegistrationModelAdapter(),
    );
    Hive.registerAdapter(
      UserChittiModelAdapter(),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => GlobalProvider()),
        ChangeNotifierProvider(create: (context) => TakeChitProvider()),
        ChangeNotifierProvider(create: (context) => AllChittiProvider()),
        ChangeNotifierProvider(create: (context) => TakeChitProvider()),
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
      ],
      child: MaterialApp(
        navigatorKey: RoutesManager.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
