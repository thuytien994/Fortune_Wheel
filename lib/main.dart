import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/lucky_wheel_new/lucky_wheel_page.dart';
import 'package:flutter_application_1/lucky_wheel_new/ui_platform/desktop/components/mqtt.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final MQTTManager mqttService = MQTTManager();
void main() async {
  // HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  // await mqttService.connect();
  runApp(const ProviderScope(child: MyApp()));
  // mqttService.publish('your/topic', 'Van Linh');
  // await mqttService.subscribe('your/topic');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        builder: (context, child) => const LuckyWheelPage(
          shopId: 12,
        ),

        debugShowCheckedModeBanner: false,
        // home: LuckyWheelPage(
        //   shopId: 1,
        // ),s
      ),
      //     MaterialApp.router(
      //   title: 'Spin Kenbar',
      //   debugShowCheckedModeBanner: false,
      //  builder: EasyLoading.init(),
      //   theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     useMaterial3: true,
      //   ),
      //   routerConfig: _router,
      //   //builder: (context, child) => const LuckyWheelPage(),
      // ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/:id',
      builder: (BuildContext context, GoRouterState state) {
        final id = state.pathParameters['id'];
        return LuckyWheelPage(
          shopId: int.tryParse(id ?? '1') ?? 1,
        );
      },
    ),
  ],
);
