import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaleup/src/splash_screen/splash_ui.dart';
import 'package:provider/provider.dart';
import 'package:scaleup/src/task_two/provider/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..loadProducts(),
        ),
      ],
      child: ScaleUpAdd(),
    ),
  );
}

class ScaleUpAdd extends StatefulWidget {
  const ScaleUpAdd({super.key});

  @override
  State<ScaleUpAdd> createState() => _ScaleUpAddState();
}

class _ScaleUpAddState extends State<ScaleUpAdd> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
