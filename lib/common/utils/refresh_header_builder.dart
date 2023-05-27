import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 自定义下拉刷新
Widget refreshHeader() => const CustomHeader(builder: _refreshHeaderBuilder);

Widget _refreshHeaderBuilder(BuildContext context, RefreshStatus? mode) {
  const double iconSize = 24;
  const Color iconColor = Colors.white;
  const SizedBox spaceBox = SizedBox(width: 10);

  IconData? icon;
  String text;
  switch (mode) {
    case RefreshStatus.idle:
      icon = Icons.arrow_downward_rounded;
      text = '下拉刷新';
      break;
    case RefreshStatus.canRefresh:
      icon = Icons.arrow_upward_rounded;
      text = '松开刷新';
      break;
    case RefreshStatus.refreshing:
      return _buildRefreshIndicator(
        const SpinKitFadingCircle(color: iconColor, size: iconSize),
        '正在刷新中',
        spaceBox,
      );
    case RefreshStatus.completed:
      icon = Icons.sentiment_satisfied_alt_rounded;
      text = '刷新成功';
      break;
    case RefreshStatus.failed:
      icon = Icons.sentiment_dissatisfied_sharp;
      text = '刷新失败';
      break;
    default:
      return Container();
  }
  return _buildRefreshIndicator(
    Icon(icon, size: iconSize, color: iconColor),
    text,
    spaceBox,
  );
}

// 下拉刷新指示器
Widget _buildRefreshIndicator(
  Widget icon,
  String text,
  SizedBox spaceBox,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        spaceBox,
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    ),
  );
}
