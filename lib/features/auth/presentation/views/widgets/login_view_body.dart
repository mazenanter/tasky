import 'package:flutter/material.dart';
import 'package:tasky/core/widgets/custom_art_image.dart';
import 'package:tasky/features/auth/presentation/views/widgets/bottom_login_body.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomArtImage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BottomLoginBody(height: height),
        ),
      ],
    );
  }
}
