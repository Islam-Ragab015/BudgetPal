import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              )),
          const Text(
            "My Wallet",
            style: FontHelper.font18BoldWhite,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
    );
  }
}
