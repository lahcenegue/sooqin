import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sooqin/core/widgets/check_notification.dart';
import 'package:sooqin/logic/Bindings/main_bindings.dart';
import 'package:sooqin/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  checkNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale('ar'),
      initialRoute: AppRoutes.home,
      initialBinding: MainBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
