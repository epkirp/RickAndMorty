import 'package:flutter/material.dart';
import 'package:rick_and_morty/resources/app_colors.dart';

class PullRefreshWidget extends StatelessWidget {
  final Widget child;
  final Function() onRefresh;
  final ScrollController? scrollController;

  const PullRefreshWidget({
    Key? key,
    required this.onRefresh,
    required this.child,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.teal,
      onRefresh: () async {
        await onRefresh();
      },
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            child: child,
          );
        },
      ),
    );
  }
}
