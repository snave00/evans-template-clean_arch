import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/button/bouncing_button.dart';
import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/widget_const.dart';

class HomeServiceItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const HomeServiceItem({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BouncingButton(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: WidgetSize.s56,
            height: WidgetSize.s56,
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(WidgetPadding.paddingS),
            child: Image(
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
          const Spacing.vertical(size: SpacingSize.s),

          // title
          Text(title),
        ],
      ),
    );
  }
}
