import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/data/local/daos/expense_dao.dart';
import 'package:income_tracker_app/data/local/daos/income_dao.dart';

class FinanceService extends GetxService {
  final AppDatabase db;
  late final ExpenseDao expenseDao;
  late final IncomeDao incomeDao;

  late RxList<Expense> expenses = <Expense>[].obs;
  late RxList<IncomeEntry> incomes = <IncomeEntry>[].obs;

  final totalIncome = 0.0.obs;
  final totalExpense = 0.0.obs;
  final RxDouble netBalance = 0.0.obs;

  FinanceService(this.db) {
    expenseDao = db.expenseDao;
    incomeDao = db.incomeDao;
  }

  Future<void> init() async {
    incomeDao.watchTotalIncome().listen((value) {
      totalIncome.value = value;
    });
    expenseDao.watchTotalExpense().listen((value) {
      totalExpense.value = value;
    });

    everAll([totalIncome, totalExpense], (_) => _computeNet());

    // Reactively watch lists
    incomeDao.watchAllIncomeEntries().listen((entries) {
      incomes.assignAll(entries);
    });

    expenseDao.watchAllExpenseEntries().listen((entries) {
      expenses.assignAll(entries);
    });
  }

  void _computeNet() {
    netBalance.value = totalIncome.value - totalExpense.value;
  }
}
