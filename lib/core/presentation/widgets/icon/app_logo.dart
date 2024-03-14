import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/asset_const.dart';
import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';
import '../spacing/spacing.dart';
import '../text/pro_label.dart';

enum AppLogoType {
  logoOnly,
  logoOnlyOutlined,
  circle,
  roundedSquare,
  nameLogo,
}

class AppLogo extends StatelessWidget {
  final AppLogoType appLogoType;
  final bool? showProLabel; // circle has no pro label
  final double? size;
  final double? outlinedStrokeWidth; // for logoOnlyOutlined only

  const AppLogo({
    super.key,
    required this.appLogoType,
    this.showProLabel = false,
    this.size,
    this.outlinedStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    if (appLogoType == AppLogoType.logoOnly) {
      return _buildLogoOnly(theme: theme);
    }

    if (appLogoType == AppLogoType.logoOnlyOutlined) {
      return _buildLogoOnlyOutlined(theme: theme);
    }

    // padding for circle

    if (appLogoType == AppLogoType.circle) {
      return _buildCircleLogo(theme: theme);
    }

    if (appLogoType == AppLogoType.roundedSquare) {
      return _buildRoundSquareLogo(theme: theme);
    }

    if (appLogoType == AppLogoType.nameLogo) {
      return _buildNameLogo(isDarkMode: isDarkMode);
    }

    return Container();
  }

  Widget _buildLogoOnly({required ThemeData theme}) {
    const defaultSize = WidgetSize.s60;

    return SizedBox(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      child: SvgPicture.asset(
        AssetConst.icMoneyFestLogo,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildLogoOnlyOutlined({required ThemeData theme}) {
    const defaultSize = WidgetSize.s60;
    final padding = (size ?? defaultSize) / 7;
    return Container(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: outlinedStrokeWidth ?? 2,
        ),
      ),
      child: SvgPicture.asset(
        AssetConst.icMoneyFestLogo,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildCircleLogo({required ThemeData theme}) {
    const defaultSize = WidgetSize.s60;
    final padding = (size ?? defaultSize) / 5;
    return Container(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AssetConst.icMoneyFestLogo,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildRoundSquareLogo({required ThemeData theme}) {
    const defaultSize = WidgetSize.s60;
    final padding = (size ?? defaultSize) / 5;
    final radius = (size ?? defaultSize) / 4;

    if (showProLabel ?? false) {
      return ClipRRect(
        child: Banner(
          message: StringConst.pro.toUpperCase(),
          color: Colors.blue,
          location: BannerLocation.topEnd,
          child: _buildRoundedSquareLogoNoBanner(
            theme: theme,
            defaultSize: defaultSize,
            padding: padding,
            radius: radius,
          ),
        ),
      );
    }

    return _buildRoundedSquareLogoNoBanner(
      theme: theme,
      defaultSize: defaultSize,
      padding: padding,
      radius: radius,
    );
  }

  Widget _buildRoundedSquareLogoNoBanner({
    required ThemeData theme,
    required double defaultSize,
    required double padding,
    required double radius,
  }) {
    return Container(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SvgPicture.asset(
        AssetConst.icMoneyFestLogo,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildNameLogo({required bool isDarkMode}) {
    const defaultSize = WidgetSize.s140;
    return Row(
      children: [
        SizedBox(
          width: size ?? defaultSize,
          child: Image(
            // default image
            image: AssetImage(
              isDarkMode
                  ? AssetConst.icMoneyfestLogoWordDark
                  : AssetConst.icMoneyfestLogoWordLight,
            ),
          ),
        ),
        if (showProLabel ?? false)
          const Spacing.horizontal(size: SpacingSize.s),
        if (showProLabel ?? false) const ProLabel(),
      ],
    );
  }
}
