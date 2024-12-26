import 'package:flutter/material.dart';
import 'services/services_index.dart';
import 'presentationals/presentationals_index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common/routes/custom_route.dart';
import 'common/themes/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesFacade.initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: '',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3E5F5)),
            useMaterial3: true,
            textTheme: GoogleFonts.oswaldTextTheme(),
            extensions: const <ThemeExtension<dynamic>>[
              CustomAppColor(
                brandColor: Colors.blue,
                danger: Colors.red,
              ),
            ],
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteDefination.main.getName(),
          routes: {
            RouteDefination.main.getName(): (context) => const ScreenDemo(),
          },
        );
      },
    );
  }
}
