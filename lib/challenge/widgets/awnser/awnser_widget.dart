import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  AwnserWidget(
      {required this.title, this.isRight = false, this.isSelected = false});

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => isRight
      ? AppTextStyles.bodyDarkGreen.merge(TextStyle(fontSize: 16))
      : AppTextStyles.bodyDarkRed.merge(TextStyle(fontSize: 16));

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color:
                    isSelected ? _selectedBorderCardRight : AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Text(
                title,
                style: isSelected
                    ? _selectedTextStyleRight
                    : AppTextStyles.body.merge(TextStyle(fontSize: 16)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(BorderSide(
                      color: isSelected
                          ? _selectedBorderRight
                          : AppColors.border))),
              width: 24,
              height: 24,
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      color: AppColors.white,
                      size: 16,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
