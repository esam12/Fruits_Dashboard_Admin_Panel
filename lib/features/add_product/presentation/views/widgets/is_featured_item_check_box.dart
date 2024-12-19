import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/core/utils/constants/app_colors.dart';
import 'package:fruits_hub_admin/core/utils/constants/app_text_styles.dart';
import 'package:fruits_hub_admin/core/utils/constants/sizes.dart';
import 'package:fruits_hub_admin/core/widgets/custom_check_box.dart';

class IsFeaturedItemCheckBox extends StatefulWidget {
  const IsFeaturedItemCheckBox({super.key, required this.onChanged, required this.text});
  final ValueChanged<bool> onChanged;
  final String text;

  @override
  State<IsFeaturedItemCheckBox> createState() => _IsFeaturedItemCheckBoxState();
}

class _IsFeaturedItemCheckBoxState extends State<IsFeaturedItemCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
            isChecked: isChecked,
            onChanged: (value) {
              isChecked = value;
              widget.onChanged(value);
              setState(() {});
            }),
        const SizedBox(width: Sizes.md),
        Expanded(
          child: Text(
            widget.text,
            style:
                TextStyles.semiBold13.copyWith(color: AppColors.greyTextColor),
          ),
        ),
      ],
    );
  }
}
