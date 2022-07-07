import 'package:get/get.dart';
import 'database.dart';

class DataFetch extends GetxController {
  List<LocationData> data = <LocationData>[];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void add(LocationData location) {
    DatabaseHelper.instance.add(location);
    getData();
  }

  void delete(int id) {
    DatabaseHelper.instance.delete(id);
    getData();
  }

  getData() async {
    data = await DatabaseHelper.instance.getData();
    update();
  }
}
