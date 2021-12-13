import 'package:flutter/material.dart';
import 'package:rick_and_morty/widgets/progress_indicator_widget.dart';

class PaginationWidget extends StatelessWidget {
  final Widget child;
  final bool isPaginationLoading;

  const PaginationWidget({
    Key? key,
    required this.child,
    required this.isPaginationLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        child,
        if (isPaginationLoading)
          const SliverToBoxAdapter(
            child: ProgressIndicatorWidget(),
          ),
      ],
    );
  }
}
