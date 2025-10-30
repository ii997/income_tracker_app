import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/data/local/daos/activity_dao.dart';

class RecentActivityController extends GetxController {
  final AppDatabase db;
  late final ActivityDao activityDao;
  late final Stream<List<RecentActivityData>> recentActivities;
  RxBool isLoading = false.obs;

  RecentActivityController(this.db) {
    activityDao = db.activityDao;
  }

  @override
  void onInit() {
    super.onInit();
    recentActivities = db.activityDao.watchRecentActivities();
  }
}
