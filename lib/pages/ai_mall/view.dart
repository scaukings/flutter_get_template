import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AiMallPage extends StatefulWidget {
  const AiMallPage({Key? key}) : super(key: key);

  @override
  State<AiMallPage> createState() => _AiMallPageState();
}

class _AiMallPageState extends State<AiMallPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _AiMallViewGetX();
  }
}

class _AiMallViewGetX extends GetView<AiMallController> {
  const _AiMallViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("AiMallPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiMallController>(
      init: AiMallController(),
      id: "ai_mall",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("ai_mall")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
