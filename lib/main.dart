import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/router/app_pages.dart';
import 'package:income_tracker_app/router/app_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  Get.put<AppDatabase>(db, permanent: true);

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!, // new publishable key
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      theme: ShadThemeData(
        colorScheme: ShadZincColorScheme.light(),
        brightness: Brightness.light,
        textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),
      ),
      appBuilder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.home,
        getPages: AppPages.pages,
        builder: (context, child) {
          return ShadAppBuilder(child: child!);
        },
      ),
    );
  }
}
