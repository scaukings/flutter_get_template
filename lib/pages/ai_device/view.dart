import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AiDevicePage extends StatefulWidget {
  const AiDevicePage({Key? key}) : super(key: key);

  @override
  State<AiDevicePage> createState() => _AiDevicePageState();
}

class _AiDevicePageState extends State<AiDevicePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _AiDeviceViewGetX();
  }
}

class _AiDeviceViewGetX extends GetView<AiDeviceController> {
  const _AiDeviceViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("AiDevicePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiDeviceController>(
      init: AiDeviceController(),
      id: "ai_device",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("ai_device")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
