import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../colors/colors.dart';

class DashboardComponents extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color color;
  final IconData icon;
  final double scores;
  const DashboardComponents(
      {Key? key,
      this.title,
      this.subtitle,
      this.color = uiColor1,
      this.scores = 0.0,
      this.icon = Icons.access_time_filled_outlined})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 150,
        width: MediaQuery.of(context).size.width *.15,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon, size: 30),
                      const SizedBox(height: 10),
                      Text(title!,
                          style: const TextStyle(color: kGrey, fontSize: 18)).tr(),
                      const SizedBox(height: 20),
                      Text(
                        "\$ $subtitle",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kGrey,
                            fontSize: 22),
                      ).tr()
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: CircularPercentIndicator(
                radius: 35.0,
                lineWidth: 8.0,
                animation: true,
                percent: scores,
                center: Text(
                    "$scores%",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                // footer: const Text("percentage").tr(),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: kBlue,
              ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
