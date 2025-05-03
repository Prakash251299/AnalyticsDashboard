import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:flutter/material.dart';
// import 'package:paracels/themes/themes.dart';

class ParaDropDownButton<T> extends StatelessWidget {
  const ParaDropDownButton({
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.textBuilder,
    super.key,
  });

  final T selectedValue;
  final List<T> items;
  final String Function(T) textBuilder;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ParaSizes.spacing4),
        border: Border.all(color: ParaColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.only(
            left: ParaSizes.spacing12,
            right: ParaSizes.spacing4,
            bottom: ParaSizes.spacing4,
            top: ParaSizes.spacing4,
          ),
          child: DropdownButton(
            dropdownColor: ParaColors.background,
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: ParaColors.secondary,
            ),
            isDense: true,
            style: ParaTextStyles.body2,
            value: selectedValue,
            items: items
          .map(
            (T value) => DropdownMenuItem<T>(
              value: value,
              child: Text(
                textBuilder(value),
                style: ParaTextStyles.body2,
              ),
            ),
          )
          .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
