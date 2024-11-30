import 'package:budget_pal/core/helpers/spacing.dart';
import 'package:budget_pal/core/theming/fonts.dart';
import 'package:flutter/material.dart';

class ExpenseTileWidget extends StatelessWidget {
  const ExpenseTileWidget({
    super.key,
    required String title,
    required String amount,
    required String type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 41, 39, 78),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dining Out",
                      style: FontHelper.font18BoldWhite,
                    ),
                    verticalSpace(10),
                    const Text(
                      "Nov 26",
                      style: FontHelper.font13GreyW300,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "-200 \$",
                    style: FontHelper.font18BoldWhite,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: double.infinity,
                width: 20,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
              ))
        ],
      ),
    );
  }
}
