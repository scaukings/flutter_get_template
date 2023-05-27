import 'package:get/get.dart';

class AiChatController extends GetxController {
  AiChatController();

  _initData() {
    update(["ai_chat"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    print("聊天界面初始化完成");
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
