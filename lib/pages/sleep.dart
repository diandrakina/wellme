import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Builder(
            builder: (context) {
              return Container(color: AppColors.background);
            },
          ),
        ),
        body: Container(
          color: AppColors.background,
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.maxFinite,
          child: SingleChildScrollView(
            // color: AppColors.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),

                //CONTAINER REMINDER
                Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      color: AppColors.reminderBox,
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(
                  height: 20,
                ),

                //CONTAINER RECORD
                Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.recordBox,
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(
                  height: 20,
                ),

                //CONTAINER INFORMATION
                Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      color: AppColors.informationBox,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
