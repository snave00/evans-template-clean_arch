import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../domain/entities/promo_entity.dart';

class PromoItem extends StatelessWidget {
  final PromoEntity promoEntity;
  final void Function()? onTap;

  const PromoItem({
    super.key,
    required this.promoEntity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _buildItem(theme: theme);
  }

  Widget _buildItem({required ThemeData theme}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: WidgetSize.s200,
        padding: const EdgeInsets.all(WidgetPadding.paddingM),
        decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(
            WidgetBorderRadius.border12,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(theme: theme),
            const Spacing.vertical(size: SpacingSize.s),
            _buildDesc(theme: theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle({required ThemeData theme}) {
    return Text(
      promoEntity.promoName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDesc({required ThemeData theme}) {
    return Text(
      promoEntity.promoDesc,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodySmall?.copyWith(),
      textAlign: TextAlign.center,
    );
  }
}
