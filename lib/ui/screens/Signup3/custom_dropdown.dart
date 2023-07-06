import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';




class CustomDropdownButton2<T> extends StatelessWidget {
  final String hint;

  final void Function(T?) onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final Color? fillColor;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final String? Function(T?)? validator;
  final void Function(T?)? onSaved;
  final String Function(T) itemAsString;
  final List<T> items;
  final double outerBorderRadius;
  final Color hintTextColor;
  final Color itemTextColor;

  const CustomDropdownButton2({
    required this.hint,
    // required this.value,
    //required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.fillColor = Colors.transparent,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.validator,
    this.onSaved,
    required this.itemAsString,
    required this.items,
    this.outerBorderRadius = 5,
    this.hintTextColor = Colors.white,
    this.itemTextColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        validator: validator,
        onSaved: onSaved,
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: hintTextColor,
            ),
          ),
        ),
        //value: value,
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Container(
                  width: double.infinity,
                  alignment: valueAlignment,
                  child: Text(
                    itemAsString(item),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: itemTextColor,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ?? const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: iconSize ?? 20,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding: buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        decoration: InputDecoration(
          isDense: true,
          fillColor: fillColor,
          filled: true,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(outerBorderRadius),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(outerBorderRadius),
          ),
        ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 42,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: dropdownHeight ?? 250,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color:  Colors.grey,
              ),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: 3,
        scrollbarAlwaysShow: true,
        offset: offset,
        dropdownOverButton: false,
      ),
    );
  }
}
