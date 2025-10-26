import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/data/local/daos/expense_dao.dart';
import 'package:income_tracker_app/data/local/daos/income_dao.dart';
import 'package:income_tracker_app/features/expenses/expense_controller.dart';
import 'package:income_tracker_app/features/incomes/income_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  static IncomeController incomeCtrller = Get.find();
  static ExpenseController expenseCtrller = Get.find();
  static HomeController homeCtrl = Get.find();

  late final ExpenseDao expenseDao;
  late final IncomeDao incomeDao;
  late final RxList<Expense> expenses;
  late final RxList<IncomeEntry> incomeEntries;
  late final AppDatabase db;
  final RxBool isLoading = false.obs;
  final RxDouble netBalance = 0.0.obs;

  HomeController(this.db) {
    expenseDao = db.expenseDao;
    incomeDao = db.incomeDao;
    expenses = <Expense>[].obs;
    incomeEntries = <IncomeEntry>[].obs;
  }

  @override
  void onInit() {
    super.onInit();
    // Load initial data
    Future.microtask(() async {
      expenses.assignAll(await expenseDao.getAllExpenses());
      incomeEntries.assignAll(await incomeDao.getAllIncomeEntries());
    });

    // 🔥 Automatically recompute net balance when either total changes
    everAll([expenseCtrller.totalExpense, incomeCtrller.totalIncome], (_) {
      netBalance.value =
          incomeCtrller.totalIncome.value - expenseCtrller.totalExpense.value;
    });
  }
}
