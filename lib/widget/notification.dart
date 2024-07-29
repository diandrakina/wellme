// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/styles/styles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int notificationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: AppColors.background,
        title: Text(
          'Notifications',
          style: TextStyles.header,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TileNotification(
              icon: FaIcon(
                FontAwesomeIcons.bed,
                size: 20,
              ),
              subtitle: "Time to sleep now!",
              title: "Sleep Reminder"),
          Divider(),
          TileNotification(
              icon: FaIcon(
                FontAwesomeIcons.glassWater,
                size: 25,
              ),
              subtitle:
                  "Great job! You have done your water journey! Keep on track!",
              title: "Drink Reward"),
          Divider(),
          TileNotification(
              icon: FaIcon(
                FontAwesomeIcons.running,
                size: 25,
              ),
              subtitle: "Get your first 10K now!",
              title: "It's time to run!"),
          Divider(),
          TileNotification(
              icon: FaIcon(
                FontAwesomeIcons.running,
                size: 25,
              ),
              subtitle: "Let's having fun and run with @FredySunjaya",
              title: "Reminder to Running"),
          Divider(),
          TileNotification(
              icon: FaIcon(
                FontAwesomeIcons.glassWater,
                size: 25,
              ),
              subtitle: "Drink Reminder",
              title: "Don't forget to have your 3rd glass of water today"),
        ],
      ),
    );
  }
}

class TileNotification extends StatelessWidget {
  final String title;
  final String subtitle;
  final FaIcon icon;
  const TileNotification(
      {super.key,
      required this.icon,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        "$title",
        style: TextStyles.notificationTitle,
      ),
      subtitle: Text(
        "$subtitle",
        style: TextStyles.notificationSubtitle,
      ),
    );
  }
}
