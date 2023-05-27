import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/userinfo.dart';
import 'index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _ProfileViewGetX();
  }
}

class _ProfileViewGetX extends GetView<ProfileController> {
  const _ProfileViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const CustomScrollView(
      slivers: [
        UserInfo(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
