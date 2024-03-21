import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/textfield/custom_search_text_form_field.dart';
import '../../../../../utils/constants/widget_const.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PagePadding.pagePadding,
        ),
        child: CustomSearchTextFormField(
          onChanged: (value) {},
        ),
      ),
    );
  }
}
