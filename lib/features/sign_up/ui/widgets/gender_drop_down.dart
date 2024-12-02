import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import '../../../../core/theme/colors.dart';

const List<String> _list = [
  'Engineer',
  'Mail',
  'Femail',
];

class GenderDropDown extends StatelessWidget {
  const GenderDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      decoration: CustomDropdownDecoration(
          // headerStyle: TextStyles.font16WhiteMedium,
          closedFillColor: const Color.fromARGB(255, 255, 255, 255),
          closedBorder:
              Border.all(color: ColorsManager.lighterGray, width: 1.3),
          expandedBorderRadius: BorderRadius.circular(16.0),
          expandedBorder:
              Border.all(color: ColorsManager.mainBlue, width: 1.3)),
      hintText: 'Select a Gender',
      items: _list,
      // initialItem: _list[0],
      onChanged: (value) {
        log('changing value to: $value');
      },
    );
  }
}
