import 'package:flutter/material.dart';
import 'package:smart_admin/core/constants/color_constants.dart';
import 'package:smart_admin/responsive.dart';
import 'package:smart_admin/screens/dashboard/components/header.dart';
import 'package:smart_admin/screens/dashboard/components/mini_information_card.dart';
import 'package:smart_admin/screens/dashboard/components/recent_forums.dart';
import 'package:smart_admin/screens/dashboard/components/recent_users.dart';
import 'package:smart_admin/screens/dashboard/components/user_details_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              const MiniInformation(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const RecentUsers(),
                        const SizedBox(height: defaultPadding),
                        const RecentDiscussions(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          const UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 2,
                      child: UserDetailsWidget(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
