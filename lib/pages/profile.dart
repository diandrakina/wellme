import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/styles/styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        toolbarHeight: 60,
        title: Text("Profile"),
        titleTextStyle: TextStyles.header,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(8)),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/box_bayi_tidur.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              "Fredy Sunjaya",
              style: TextStyles.header,
            ),
            Padding(padding: EdgeInsets.all(8)),

            //
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.amber),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: HorizontalBarChart(_createSampleData1(),
                        title: 'Chart 1'),
                  ),
                  Expanded(
                    child: HorizontalBarChart(_createSampleData2(),
                        title: 'Chart 2'),
                  ),
                  Expanded(
                    child: HorizontalBarChart(_createSampleData3(),
                        title: 'Chart 3'),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.amber),
            ),
            Padding(padding: EdgeInsets.all(8)),

            //Settings
            Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.detailBox),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(
                    child: FaIcon(
                      FontAwesomeIcons.gear,
                      size: 30,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Settings",
                    style: TextStyles.record,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
