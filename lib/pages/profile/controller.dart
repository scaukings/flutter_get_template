import 'package:get/get.dart';
import 'package:ai_device_app/models/index.dart';

class ProfileController extends GetxController {
  ProfileController();

  ProfileModel? user;

  _initData() {
    update(["profile"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    print("我的界面初始化完成");
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
