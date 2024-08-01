import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.reminderBox,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                "Reminder",
                style: TextStyles.reminder,
              ),
              Text(
                "Minum air woy!",
                style: TextStyles.body,
              ),
              Text(
                "13.00 - 15.00",
                style: TextStyles.time,
              )
            ],
          ),
          const SizedBox(
            width: 120,
          ),
          const Icon(
            Icons.alarm,
            size: 75,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
