import 'package:IT_workout/IT_workout/modules/bmi/bmiCubit/bmi_cubit.dart';
import 'package:IT_workout/IT_workout/modules/bmi/bmiCubit/bmi_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Bmi> {
  bool BMICal = false;
  int BMI = 0;
  bool isMale = true;
  double hight = 180;
  int age = 18;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit,BmiStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 75,
              title: Text(
                'Colculate your bmi to track your progres',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: isMale ? Colors.grey : Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/image/IMG-20241120-WA0001.jpg'),
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                  color: Colors.red,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: !isMale ? Colors.grey : Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/image/IMG-20241120-WA0000.jpg'),
                                  height: 70,
                                  width: 70,
                                  color: Colors.red,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'FAMALE',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hight',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 30),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${hight.round()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 30),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Slider(
                          onChanged: (value) {
                            setState(() {
                              hight = value;
                            });
                          },
                          value: hight,
                          min: 100,
                          max: 220,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 30),
                              ),
                              Text(
                                '${age}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    ),
                                    mini: true,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.red,
                                    ),
                                    mini: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                              Text(
                                '${weight}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    ),
                                    mini: true,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    child: Icon(Icons.add, color: Colors.red),
                                    mini: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red),
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => BmiResult(age: age, isMale: isMale, result: weight+hight.round()),)
                          // );
                          Navigator.pop(context);
                          BMI = weight + hight.round();
                        },
                        child: Text(
                          'Colculate',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )),
                )
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
