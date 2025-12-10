import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaleup/src/bottom/bottom_nav_bar.dart';
import 'package:scaleup/src/splash_screen/splash_ui.dart';
import 'package:provider/provider.dart';
import 'package:scaleup/src/task_three/all_provider/dark_provider.dart';
import 'package:scaleup/src/task_three/all_provider/note_provider.dart';
import 'package:scaleup/src/task_two/provider/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dark Mode Switch',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
