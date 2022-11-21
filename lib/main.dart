import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fourkids/src/application/login/bloc/login_bloc.dart';
import 'package:fourkids/src/domain/core/di/injectable.dart';
import 'package:fourkids/src/presentation/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 760),
        builder: (context, widget) {
          return MultiBlocProvider(providers: [
            BlocProvider(create: (context) => getIt<LoginBloc>(),)
          ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: '4kids',
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              home: const SplashScreen(),
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!);
              },
            ),
          );
        });
  }
}
