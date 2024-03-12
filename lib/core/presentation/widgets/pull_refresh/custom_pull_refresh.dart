import 'package:flutter/material.dart';

class CustomPullRefresh extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const CustomPullRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: child,
    );
    // return LiquidPullToRefresh(
    //   onRefresh: onRefresh,
    //   springAnimationDurationInMilliseconds: 500,
    //   animSpeedFactor: 3,
    //   showChildOpacityTransition: false,
    //   color: theme.colorScheme.primary,
    //   child: child,
    // );
  }
}
