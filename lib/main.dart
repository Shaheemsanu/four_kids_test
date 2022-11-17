import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fourkids/src/presentation/view/order_detail_screen/order_detail_screen.dart';
import 'package:fourkids/src/presentation/view/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 760),
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '4kids',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: const OrderDetailScreen(),
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!);
            },
          );
        });
  }
}
