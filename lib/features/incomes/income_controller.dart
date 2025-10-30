import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/daos/income_dao.dart';
import 'package:income_tracker_app/utils/snackbar_helper.dart';
import '../../data/local/app_database.dart';

class IncomeController extends GetxController {
  final AppDatabase db;
  late final IncomeDao incomeEntriesDAO;
  RxBool isLoading = false.obs;
  RxBool isLoadingTotals = false.obs;

  RxString selectedCategory = ''.obs;

  IncomeController(this.db) {
    incomeEntriesDAO = db.incomeDao;
  }

  // Constructor for adding a new income entry

  RxString description = ''.obs;
  RxDouble amount = 0.0.obs;
  RxBool isShared = false.obs;
  RxDouble sharePercent = 0.35.obs;
  RxDouble amountShared = 0.0.obs;
  RxDouble ownerShared = 0.0.obs;
  RxBool isRecurring = false.obs;
  RxDouble totalIncome = 0.0.obs;
  RxInt totalCategories = 0.obs;
  // Editing Controller for income entries
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController sharePercentController = TextEditingController();
  TextEditingController amountSharedController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    incomeEntriesDAO.watchTotalIncome().listen((value) {
      totalIncome.value = value;
    });
    // Keep Rx values in sync with text controllers
    ever(description, (_) => descriptionController.text = description.value);

    ever(amount, (_) => amountController.text = amount.value.toString());
    // Keep Rx values in sync with text controllers
    ever(
      amountShared,
      (_) => amountSharedController.text = amountShared.value.toString(),
    );

    // Recalculate shared amount whenever relevant fields change
    everAll([amount, amount, sharePercent, isShared], (_) {
      computeSharedAmount();
    });
  }

  Future<void> computeSharedAmount() async {
    if (isShared.value && amount.value > 0 && sharePercent.value > 0) {
      final computed = amount.value * sharePercent.value;
      amountShared.value = computed;
      amountSharedController.text = computed.toStringAsFixed(2);
    } else {
      amountShared.value = 0.0;
      amountSharedController.text = '0.0';
    }
  }

  Future<void> fetchTotalIncome() async {
    isLoadingTotals.value = true;
    try {
      final total = await db.incomeDao.getTotalIncome();
      totalIncome.value = total;
    } catch (e) {
      print('DEBUG: Failed to fetch total income: $e');
    } finally {
      isLoadingTotals.value = false;
    }
  }

  Future<void> saveEntry() async {
    final newEntry = IncomeEntriesCompanion(
      amount: drift.Value(amount.value),
      incomeCategory: drift.Value(selectedCategory.value),
      isShared: drift.Value(isShared.value),
      sharePercent: drift.Value(sharePercent.value),
      amountShared: drift.Value(amountShared.value),
    );

    try {
      await incomeEntriesDAO.insertIncome(newEntry);
      Get.back(); // close bottom sheet
      SnackbarHelper.showIncomeSaved();
      await fetchTotalIncome(); // refresh list
      // Update home controller's income entries
      resetForm();
    } catch (e) {
      SnackbarHelper.showError('Failed to save income. Please try again.');
      return;
    }
  }

  Future<void> deleteEntry(int id) async {
    try {
      await (db.delete(db.incomeEntries)..where((t) => t.id.equals(id))).go();
    } catch (e) {
      print('DEBUG: Deletion failed with error: $e');
    }
  }

  void resetForm() {
    description.value = '';
    amount.value = 0.0;
    isShared.value = false;
    sharePercent.value = 0.35;
    amountShared.value = 0.0;
    isRecurring.value = false;

    descriptionController.clear();
    amountController.clear();
    sharePercentController.text = '0.35';
    amountSharedController.text = '0.0';
  }
}
