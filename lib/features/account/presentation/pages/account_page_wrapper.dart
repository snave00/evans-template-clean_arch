import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/icon/app_logo.dart';

class AccountPageWrapper extends StatelessWidget {
  const AccountPageWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLogo(appLogoType: AppLogoType.logoOnly),
      ),
    );
  }
}
