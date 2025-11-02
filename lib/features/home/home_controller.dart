import 'package:get/get.dart';
import 'package:income_tracker_app/services/finance_service.dart';

class HomeController extends GetxController {
  final financeService = Get.find<FinanceService>();

  RxDouble get netBalance => financeService.netBalance;
  RxList get incomes => financeService.incomes;
  RxList get expenses => financeService.expenses;

  @override
  void onInit() {
    super.onInit();
    financeService.init();
  }

  //   Future<void> refreshData() async {
  //     await financeService.loadInitialData();
  //   }
  // }
}
