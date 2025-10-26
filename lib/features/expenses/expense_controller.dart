import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/data/local/daos/expense_dao.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:income_tracker_app/utils/snackbar_helper.dart';

class ExpenseController extends GetxController {
  static ExpenseController get to => Get.find();
  late final AppDatabase db;
  late final ExpenseDao expenseDao;
  final RxDouble totalExpense = 0.0.obs;
  final RxString description = ''.obs;
  RxDouble amount = 0.0.obs;

  RxBool isLoadingTotals = false.obs;
  RxString selectedCategory = ''.obs;

  ExpenseController(this.db) {
    expenseDao = db.expenseDao;
  }

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    expenseDao.watchTotalExpense().listen((value) {
      totalExpense.value = value;
    });
  }

  Future<void> saveExpenseEntry() async {
    final newExpense = ExpensesCompanion(
      category: drift.Value(selectedCategory.value),
      amount: drift.Value(amount.value),
    );

    try {
      await expenseDao.insertExpense(newExpense);
      Get.back(); // close bottom sheet
      SnackbarHelper.showExpenseSaved();
      // Update home controller's expenses
      final homeCtrl = Get.find<HomeController>();
      homeCtrl.expenses.assignAll(await homeCtrl.expenseDao.getAllExpenses());
      resetForm();
    } catch (e) {
      SnackbarHelper.showError('Failed to save expense. Please try again.');
      return;
    }
  }

  void resetForm() {
    description.value = '';
    amount.value = 0.0;
    descriptionController.clear();
    amountController.clear();
  }
}
