import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/views/widgets/task_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _selectedIndex = 0;
  final List<String> _statuses = ["All", "In Progress", "Waiting", "Finished"];
  @override
  Widget build(BuildContext context) {
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
          const TaskItem(),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final String status;

  const TaskList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // هنا يمكنك فلترة وعرض قائمة المهام بناءً على الحالة المختارة
    return Center(
      child: Text('Tasks with status: $status'),
    );
  }
}
