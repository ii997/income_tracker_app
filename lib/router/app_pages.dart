import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/features/categories/categories_screen.dart';
import 'package:income_tracker_app/features/categories/category_controller.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:income_tracker_app/features/home/home_screen.dart';
import 'package:income_tracker_app/features/incomes/consumer_controller.dart';
import 'package:income_tracker_app/features/incomes/income_list_screen.dart';
import '../features/income_sources/income_sources_controller.dart';
import '../features/income_sources/income_sources_screen.dart';
import '../features/incomes/income_controller.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      bindings: [BindingsBuilder.put(() => HomeController()),
       BindingsBuilder.put(() => IncomeController(Get.find<AppDatabase>())),],
    ),
    GetPage(
      name: '/categories',
      page: () => const CategoriesScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      binding: BindingsBuilder.put(
        () => CategoryController(Get.find<AppDatabase>()),
      ),
    ),
    GetPage(
      name: '/sources',
      page: () => const IncomeSourcesScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      binding: BindingsBuilder.put(
        () => IncomeSourcesController(Get.find<AppDatabase>()),
      ),
    ),
    GetPage(
      name: '/incomes',
      page: () => const IncomeListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      bindings: [
        BindingsBuilder.put(() => IncomeController(Get.find<AppDatabase>())),
        BindingsBuilder.put(
          () => IncomeSourcesController(Get.find<AppDatabase>()),
        ),
        BindingsBuilder.put(() => ConsumerController(Get.find<AppDatabase>())),
      ],
    ),
  ];
}
