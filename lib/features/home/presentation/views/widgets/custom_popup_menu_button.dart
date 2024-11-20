import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    this.onSelected,
  });
  final void Function(String)? onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      menuPadding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text(
            'Delete',
            style: AppTextStyles.styleMeduim16,
          ),
        ),
      ],
      child: const Icon(
        Icons.more_vert_rounded,
      ),
    );
  }
}
