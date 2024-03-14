import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/pull_refresh/custom_pull_refresh.dart';
import '../widgets/home_store/home_app_bar.dart';
import '../widgets/home_store/home_stores.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: CustomPullRefresh(
          onRefresh: () async {},
          child: const CustomScrollView(
            slivers: [
              // search bar

              // balance & points

              // restaurants for you
              HomeStores()
            ],
          ),
        ),
      ),
    );
  }
}
