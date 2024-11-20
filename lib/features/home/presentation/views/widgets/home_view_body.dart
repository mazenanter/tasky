import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/all_tasks_view.dart';
import 'package:tasky/features/home/presentation/views/widgets/finished_view.dart';
import 'package:tasky/features/home/presentation/views/widgets/inprogress_view.dart';
import 'package:tasky/features/home/presentation/views/widgets/waiting_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getTasks();
  }

  int _selectedIndex = 0;
  List<Widget> screeens = [
    const AllTasksView(),
    const InprogressView(),
    const WaitingView(),
    const FinishedView(),
  ];
  final List<String> _statuses = ["All", "In Progress", "Waiting", "Finished"];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Tasks',
                style: AppTextStyles.styleBold16.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              FittedBox(
                child: Row(
                  children: List.generate(_statuses.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedIndex == index
                              ? AppColors.primaryColor
                              : AppColors.unSelectedColor,
                          foregroundColor: _selectedIndex == index
                              ? Colors.white
                              : AppColors.unSelectedTextColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Text(_statuses[index]),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 28),
              Expanded(
                child: screeens[_selectedIndex],
              ),
            ],
          ),
        );
      },
    );
  }
}
