import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:drift/drift.dart' as drift;
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

  //Sample Seeders for dummy datas

  final categoryId = await db
      .into(db.incomeCategories)
      .insert(
        IncomeCategoriesCompanion.insert(
          categoryName: 'Business or Entrepreneural Income',
          categoryDescription: 'idk',
        ),
      );
  await db
      .into(db.incomeSources)
      .insert(
        IncomeSourcesCompanion.insert(
          sourceName: 'Wi-Fi Vendo',
          sourceCategoryId: categoryId,
        ),
      );
  final sourceId = await db
      .into(db.incomeSources)
      .insert(
        IncomeSourcesCompanion.insert(
          sourceName: 'Solo',
          sourceCategoryId: categoryId,
        ),
      );
  await db
      .into(db.incomeSources)
      .insert(
        IncomeSourcesCompanion.insert(
          sourceName: 'Others',
          sourceCategoryId: categoryId,
        ),
      );
      await db.into(db.consumers).insert(ConsumersCompanion.insert(consumerName: drift.Value('John Doe')));
      await db.into(db.consumers).insert(ConsumersCompanion.insert(consumerName: drift.Value('Nelson Baluran')));
      final id = await db.into(db.consumers).insert(ConsumersCompanion.insert(consumerName: drift.Value('Jane Rollorata')));

    await db.into(db.incomeEntries).insert(IncomeEntriesCompanion.insert(amount: 5005, incomeSourceId: sourceId, currentConsumerId: id, incomeDate: DateTime.now() ));
    await db.into(db.incomeEntries).insert(IncomeEntriesCompanion.insert(amount: 3430, incomeSourceId: sourceId, currentConsumerId: id, incomeDate: DateTime.now() ));

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
        textTheme: ShadTextTheme.fromGoogleFont(
           GoogleFonts.roboto,
        )
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
