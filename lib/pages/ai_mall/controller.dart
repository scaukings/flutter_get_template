import 'package:get/get.dart';

class AiMallController extends GetxController {
  AiMallController();

  _initData() {
    update(["ai_mall"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
