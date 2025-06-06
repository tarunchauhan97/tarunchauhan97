import 'package:flutter/material.dart';
import 'package:tarundevindia/config/theme/app_colors.dart';
import 'package:tarundevindia/ui/home/widgets/sliver_app_bar/widgets/change_language_menu_button.dart';
import 'package:tarundevindia/ui/home/widgets/sliver_app_bar/widgets/custom_navigation_bar.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkBlue,
      child: Column(
        children: [

          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: CustomNavigationBar(
                direction: Axis.vertical,
                onChange: (_) {
                  Scaffold.of(context).closeEndDrawer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
