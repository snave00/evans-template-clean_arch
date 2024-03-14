import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

class CustomCircularProgress extends StatelessWidget {
  final ProgressSize progressSize;

  const CustomCircularProgress({
    super.key,
    required this.progressSize,
  });

  @override
  Widget build(BuildContext context) {
    if (progressSize == ProgressSize.small) {
      return _buildProgress(size: WidgetSize.s16);
    }

    if (progressSize == ProgressSize.medium) {
      return _buildProgress(size: WidgetSize.s24);
    }

    if (progressSize == ProgressSize.large) {
      return _buildProgress();
    }

    return _buildProgress();
  }

  Widget _buildProgress({double? size}) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

enum ProgressSize {
  small,
  medium,
  large,
}
