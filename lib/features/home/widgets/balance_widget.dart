import 'package:budget_pal/core/helpers/spacing.dart';
import 'package:budget_pal/core/theming/fonts.dart';
import 'package:budget_pal/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        color: MyColors.navyColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                'Your Balance',
                style: FontHelper.font18BoldWhite,
              ),
              verticalSpace(5),
              const Text(
                '1000 \$',
                style: FontHelper.font28SemiBoldWhite,
              ),
            ],
          ),
          CircleAvatar(
              radius: 30,
              backgroundColor: Colors.cyan,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
