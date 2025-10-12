import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/daos/categories_dao.dart';
import '../../data/local/app_database.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();
  late final AppDatabase db;
  late final CategoriesDao categoriesDAO;
  var categories = <IncomeCategory>[].obs;
  var isLoading = false.obs;

  CategoryController(this.db) {
    categoriesDAO = db.categoriesDao;
  }


    @override
  void onInit() {
    loadCategories();
    super.onInit();
    
  }


    Future<void> loadCategories() async {
    isLoading.value = true;
    categories.value = await categoriesDAO.getAllCategories();
    isLoading.value = false;
  }


  Future<void> addCategory(IncomeCategoriesCompanion category) async {
    await categoriesDAO.insertCategory(category);
    loadCategories();
  }
}
