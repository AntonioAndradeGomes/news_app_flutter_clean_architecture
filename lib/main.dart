import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_clean/shared/routes/app_pages.dart';
import 'package:news_app_clean/src/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialBinding: InjectorBinding(),
      getPages: AppPages.pages,
      initialRoute: AppPages.initalRoute,
    );
  }
}
