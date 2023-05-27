import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({Key? key}) : super(key: key);

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _AiChatViewGetX();
  }
}

class _AiChatViewGetX extends GetView<AiChatController> {
  const _AiChatViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("AiChatPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiChatController>(
      init: AiChatController(),
      id: "ai_chat",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("ai_chat")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
