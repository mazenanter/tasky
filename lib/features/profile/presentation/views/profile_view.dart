import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_arrow_back.dart';
import 'package:tasky/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        title: const Text(
          'Profile',
          style: AppTextStyles.styleBold16,
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
