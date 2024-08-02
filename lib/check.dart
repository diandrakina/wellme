import 'package:flutter/material.dart';
import 'package:well_me/styles/styles.dart';
import 'package:well_me/tab_screen.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  int age = 33;
  double weight = 57;
  double height = 175;
  String gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: Text(
          'Customize',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('What is your gender', style: TextStyles.record),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderButton(
                    icon: Icons.male,
                    selected: gender == 'male',
                    onPressed: () {
                      setState(() {
                        gender = 'male';
                      });
                    },
                    gender: gender,
                  ),
                  GenderButton(
                    icon: Icons.female,
                    selected: gender == 'female',
                    onPressed: () {
                      setState(() {
                        gender = 'female';
                      });
                    },
                    gender: gender,
                  ),
                  GenderButton(
                    icon: Icons.transgender,
                    selected: gender == 'other',
                    onPressed: () {
                      setState(() {
                        gender = 'other';
                      });
                    },
                    gender: gender,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
              child: Text(
                'How old are you',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Slider(
              value: age.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: age.toString(),
              inactiveColor: Colors.grey,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  age = value.toInt();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '100',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
              child: Text(
                'What is your weight (in kg)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Slider(
              value: weight,
              min: 0,
              max: 200,
              divisions: 200,
              label: weight.toString(),
              inactiveColor: Colors.grey,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '200',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              child: Text(
                'What is your height (in cm)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Slider(
              value: height,
              min: 0,
              max: 200,
              divisions: 200,
              label: height.toString(),
              inactiveColor: Colors.grey,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '200',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.reminderBox),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => TabScreen()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyles.body,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  final String gender;

  GenderButton({
    required this.icon,
    required this.selected,
    required this.onPressed,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: BorderSide(
            color: selected
                ? gender == 'male'
                    ? Colors.blue
                    : gender == 'female'
                        ? Colors.pink
                        : Colors.purple
                : Colors.grey,
            width: 2),
        shape: CircleBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          icon,
          size: 80,
          color: selected
              ? gender == 'male'
                  ? Colors.blue
                  : gender == 'female'
                      ? Colors.pink
                      : Colors.purple
              : Colors.grey,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
