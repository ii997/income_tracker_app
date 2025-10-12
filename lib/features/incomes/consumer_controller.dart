import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/daos/consumer_dao.dart';

import '../../data/local/app_database.dart';

class ConsumerController extends GetxController{
  static ConsumerController get to => Get.find();

    late final AppDatabase db;
  late final ConsumersDao consumersDao;
  var consumers = <Consumer>[].obs;
  RxBool isLoading = false.obs;


ConsumerController(this.db) {
    consumersDao = db.consumersDao;
  }

  @override
  void onInit() {
    loadConsumers();
    super.onInit();
  }


    Future<void> loadConsumers() async {
    isLoading.value = true;
    consumers.value = await consumersDao.getAllConsumers();
    isLoading.value = false;
  }

}