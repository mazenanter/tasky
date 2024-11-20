import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/features/profile/data/repo/repo_impl.dart';
import 'package:tasky/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:tasky/features/profile/presentation/views/widgets/info_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(ProfileRepoImpl(ApiService(Dio())))..getUserInfo(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const CustomIndicator();
          } else if (state is ProfileError) {
            return Center(child: Text(state.errMsg));
          } else if (state is ProfileSuccess) {
            final profileInfo = state.userModel;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) => InfoItem(
                        title: profileInfo[index]["title"]!,
                        value: profileInfo[index]["value"]!,
                      ),
                      itemCount: profileInfo.length,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
