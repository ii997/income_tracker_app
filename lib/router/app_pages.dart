import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/features/expenses/activity_controller.dart';
import 'package:income_tracker_app/features/expenses/expense_controller.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:income_tracker_app/features/home/home_screen.dart';
import '../features/incomes/income_controller.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      bindings: [
        BindingsBuilder.put(() => IncomeController(Get.find<AppDatabase>())),
        BindingsBuilder.put(() => ExpenseController(Get.find<AppDatabase>())),
        BindingsBuilder.put(() => HomeController(Get.find<AppDatabase>())),
        BindingsBuilder.put(
          () => RecentActivityController(Get.find<AppDatabase>()),
        ),
      ],
    ),
  ];
}
