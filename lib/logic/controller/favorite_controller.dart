import 'package:get/get.dart';
import 'package:sooqin/Data/APIs/sqldb.dart';

class FavoriteController extends GetxController {
  List<Map> response = [];
  RxBool isLoading = true.obs;

  @override
  onInit() {
    readData();
    super.onInit();
  }

  Future<void> readData() async {
    response = await SqlDb().readData("SELECT * FROM favorite");
    isLoading(false);
    update();
  }
}
