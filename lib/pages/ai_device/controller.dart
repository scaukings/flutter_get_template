import 'package:get/get.dart';

class AiDeviceController extends GetxController {
  AiDeviceController();

  _initData() {
    update(["ai_device"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    print("设备界面初始化完成");
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
