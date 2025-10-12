import 'package:drift/drift.dart' as drift;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/daos/income_dao.dart';
import '../../data/local/app_database.dart';

class IncomeController extends GetxController {
  static IncomeController get to => Get.find();
  late final AppDatabase db;
  late final IncomeDao incomeEntriesDAO;
  var incomes = <IncomeEntryWithSource>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingTotals = false.obs;

  var selectedSourceId = ''.obs;
  var selectedConsumerId = ''.obs;

  // Constructor for adding a new income entry

  RxString description = ''.obs;
  RxDouble amount = 0.0.obs;
  RxBool isShared = false.obs;
  RxDouble sharePercent = 0.35.obs;
  RxDouble amountShared = 0.0.obs;
  RxDouble ownerShared = 0.0.obs;
  RxBool isRecurring = false.obs;
  RxDouble totalIncome = 0.0.obs; 
  RxInt totalCategories= 0.obs;
  // Editing Controller for income entries
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController sharePercentController = TextEditingController();
  TextEditingController amountSharedController = TextEditingController();

  IncomeController(this.db) {
    incomeEntriesDAO = db.incomeDao;
  }

  @override
  void onInit() {
    loadIncomeSources();
    loadTotalCategories();
    loadTotals();
    loadMonthlyTotals();
    super.onInit();

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


  Future<void> loadIncomeSources() async {
    isLoading.value = true;
    incomes.value = await incomeEntriesDAO.getAllIncomeEntries();
    isLoading.value = false;
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

  Future<void> saveEntry(int sourceId, int consumerId) async {
    final newEntry = IncomeEntriesCompanion(
      amount: drift.Value(amount.value),
      incomeSourceId: drift.Value(sourceId),
      isShared: drift.Value(isShared.value),
      sharePercent: drift.Value(sharePercent.value),
      amountShared: drift.Value(amountShared.value),
      incomeDate: drift.Value(DateTime.now()),
      isRecurring: drift.Value(isRecurring.value),
      recurringPattern: drift.Value(
        isRecurring.value ? 'monthly' : null,
      ), // Example pattern
      currentConsumerId: drift.Value(consumerId),
    );

    try {
      await db.into(db.incomeEntries).insert(newEntry);
    } catch (e) {
      print('DEBUG: Insertion failed with error: $e');
    }
    await loadIncomeSources(); // Refresh the list after adding
    await loadMonthlyTotals();
    await loadTotals();
  }

    Future<void> loadMonthlyTotals() async {
    totalIncome.value = await db.getMonthlyIncome(DateTime.now().year, DateTime.now().month); // ✅ call directly
  }

    Future<void> loadTotalCategories() async {
    totalCategories.value = await db.getTotalCategories(); // ✅ call directly
  }

    Future<void> loadTotals() async {
    totalIncome.value = await db.getTotalIncome(DateTime.now().year); // ✅ call directly
  }

  Future<void> deleteEntry(int id) async {
    try {
      await (db.delete(db.incomeEntries)..where((t) => t.id.equals(id))).go();
      await loadIncomeSources(); // Refresh the list after deleting
    } catch (e) {
      print('DEBUG: Deletion failed with error: $e');
    }
  }

  void resetForm() {
    selectedSourceId.value = 'none';
    selectedConsumerId.value = 'none';
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
