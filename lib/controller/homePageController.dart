import 'package:get/get.dart';
import 'package:scope_demo/models/ItemModel.dart';
import 'package:scope_demo/services/itemService.dart';

class HomePageController extends GetxController {
  ItemServices itemServices = ItemServices();
  List<ShopItemModel> items = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadItems();
  }

  loadItems()async{
    try {
      List list = await itemServices.loadItems();

      list.forEach((element) {
        items.add(ShopItemModel.fromJson(element));
      });
      print(items);

      update();
    } catch (e) {
      print(e);
    }
  }
}