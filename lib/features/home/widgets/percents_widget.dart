import 'package:budget_pal/core/theming/fonts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentsWidget extends StatelessWidget {
  const PercentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0,
          lineWidth: 12.0,
          percent: 0.7,
          center: const Text("70%", style: FontHelper.font18BoldWhite),
          footer: const Text("Electricity", style: FontHelper.font18BoldWhite),
          progressColor: Colors.yellow,
        ),
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0,
          lineWidth: 12.0,
          percent: 0.2,
          center: const Text("20%", style: FontHelper.font18BoldWhite),
          footer: const Text("Water", style: FontHelper.font18BoldWhite),
          progressColor: Colors.green,
        ),
        CircularPercentIndicator(
          arcType: ArcType.FULL,
          arcBackgroundColor: Colors.transparent,
          radius: 50.0,
          lineWidth: 12.0,
          percent: 0.1,
          center: const Text("10%", style: FontHelper.font18BoldWhite),
          footer: const Text("Gas", style: FontHelper.font18BoldWhite),
          progressColor: Colors.blue,
        ),
      ],
    );
  }
}
