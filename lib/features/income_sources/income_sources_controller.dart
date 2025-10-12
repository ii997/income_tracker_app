import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/data/local/daos/income_sources_dao.dart';

class IncomeSourcesController extends GetxController{
  static IncomeSourcesController get to => Get.find();
  late final AppDatabase db;
  late final IncomeSourcesDAO incomeSourcesDAO;
  var incomeSources = <IncomeSourcesWithCategoryData>[].obs;
  var isLoading = false.obs;

  IncomeSourcesController(this.db) {
    incomeSourcesDAO = db.incomeSourcesDAO;
  }


  @override
  void onInit() {
    loadIncomeSources();
    super.onInit();
    
  }

  Future<void> loadIncomeSources() async {
    isLoading.value = true;
    incomeSources.value = await incomeSourcesDAO.getSourcesWithCategory();
    isLoading.value = false;
  }
}