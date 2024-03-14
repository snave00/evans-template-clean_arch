import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/button/view_all_button.dart';
import '../../../../store/domain/entities/store_entity.dart';

class HomeStoresViewAll extends StatelessWidget {
  final List<StoreEntity> stores;

  const HomeStoresViewAll({
    super.key,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    if (stores.isNotEmpty) {
      return ViewAllButton(
        onTap: () async {
          await _goToAllStoresPage(context: context);
        },
      );
    }

    return Container();
  }

  Future<void> _goToAllStoresPage({required BuildContext context}) async {
    // await RouterFunctions.goToBudgetPage(
    //   context: context,
    //   isFromSetup: false,
    // );
  }
}
