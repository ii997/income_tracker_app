import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/features/transactions/activity_controller.dart';
import 'package:income_tracker_app/features/expenses/expense_controller.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:income_tracker_app/features/home/home_screen.dart';
import 'package:income_tracker_app/features/transactions/transactions_screen.dart';
import 'package:income_tracker_app/services/finance_service.dart';
import '../features/incomes/income_controller.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      bindings: [
        BindingsBuilder(() {
          Get.lazyPut(() => IncomeController(Get.find<AppDatabase>()));
          Get.lazyPut(() => ExpenseController(Get.find<AppDatabase>()));
          Get.lazyPut(() => FinanceService(Get.find<AppDatabase>()));
          Get.lazyPut(() => HomeController());
          Get.lazyPut(() => RecentActivityController(Get.find<AppDatabase>()));
        }),
      ],
    ),
    GetPage(
      name: '/transactions',
      page: () => const TransactionsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
