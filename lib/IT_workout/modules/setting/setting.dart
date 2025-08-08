import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _ProfileGymState();
}

class _ProfileGymState extends State<Setting> {
  String? dropDownValueSec = '15s';
  String? dropDownValueMin = '25m';
  bool BMICal = false;
  int BMI = 0;
  int kcalGoal = 200;
  bool isMale = true;
  double hight = 180;
  int age = 18;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Training Rest',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: dropDownValueSec,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(color: Colors.grey),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                        value: '15s',
                        child: Text('15s'),
                      ),
                      DropdownMenuItem<String>(
                        value: '20s',
                        child: Text('20s'),
                      ),
                      DropdownMenuItem<String>(
                        value: '25s',
                        child: Text('25s'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) dropDownValueSec = newValue;
                      });
                    })
              ],
            ),
            mySeparated(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Training time goal',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: dropDownValueMin,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(color: Colors.grey),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                        value: '25m',
                        child: Text('25m'),
                      ),
                      DropdownMenuItem<String>(
                        value: '30m',
                        child: Text('30m'),
                      ),
                      DropdownMenuItem<String>(
                        value: '35m',
                        child: Text('35m'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) dropDownValueMin = newValue;
                      });
                    })
              ],
            ),
            mySeparated(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Kcal goal',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                // Text('200',style: TextStyle(
                //   color: Colors.grey,
                //   fontWeight: FontWeight.w600,
                // ),
                // ),
                GestureDetector(
                    onTap: () => _showEditDialog(context),
                    child: Text('$kcalGoal',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            mySeparated(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'BMI',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(() as Route<Object?>);
                  },
                  child: Text(
                    BMICal ? '???' : '${BMI}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            mySeparated(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Time reminder',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                // TextButton(
                //     onPressed: (){
                //       Navigator.of(context).push(showPicker(
                //         context: context,
                //           value: _time,
                //           is24HrFormat: true,
                //           iosStylePicker: true,
                //           minuteInterval:TimePickerInterval.FIVE ,
                //           onChange: (Time time ){
                //         setState(() {
                //           _time = time;
                //         });
                //       }
                //       ));
                //     },
                //     child: Text('${_time}',style: TextStyle(
                //         color: Colors.grey,
                //         fontWeight: FontWeight.w600,
                //         fontSize: 16
                //     ),
                //     )
                // )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Personal',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Change password',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.change_circle_rounded))
              ],
            ),
            mySeparated(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Change your day workout',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.track_changes_rounded))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: kcalGoal.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Change Kcal"),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "enter your kcal goal"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("exit"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                kcalGoal = int.tryParse(controller.text) ?? kcalGoal;
              });
              Navigator.pop(context);
            },
            child: Text("save"),
          ),
        ],
      ),
    );
  }
}
