import 'package:IT_workout/IT_workout/modules/exercisesScreen/exercises_screen.dart';
import 'package:IT_workout/IT_workout/modules/trainingScreen/training_screen.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
Widget WorkoutShape(context) => InkWell(
      onTap: () {
        navigate(context, ExercisesScreen());
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 9,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width / 5,
              height: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: MyHexColors.redGradientColors),
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
              child: Image(
                image: AssetImage('assets/icons/muscles.png'),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abs Exercises'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "20 min ^ 16 Exercise",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
=======
Widget WorkoutShape (context,{required String image_path , required String name ,required String description}) =>InkWell(
  onTap: (){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5.0,
          backgroundColor: Colors.white,
          child: true ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 3*60+2*10,
              child: ListView.separated(

                  itemBuilder: (context, index) => makeMaterialButton(name: "level name" , onPressed: () {
                    navigate(context, ExercisesScreen());
                  }, border: true,),
                  separatorBuilder:(context, index) => const  SizedBox(height: 10,),
                  itemCount: 3
              ),
            ),
          ) : false ? CircularProgressIndicator(color: Colors.red,) : Center(child: Text("check your connection!"),)   ,
                      ),
        );
      },
    );


    
  },
  child: Container(
    width: double.infinity,
    height: MediaQuery.sizeOf(context).height/9,
    decoration: BoxDecoration(
        color: Colors.white
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width/5,
          height: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: MyHexColors.redGradientColors
            ),
            borderRadius:  BorderRadiusDirectional.circular(20),
          ),
          child: Image(
            image: NetworkImage(image_path),
          ),
        ),
        SizedBox(width: 15,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height:10 ,),
              Text(description,style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),),
            ],
          ),
        )
      ],
    ),
  ),
);
>>>>>>> origin

void navigate(context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

Widget makeMaterialButton({
  Color? color,
  double height = 60,
  double? width,
  required bool border,
  required void Function()? onPressed,
  required String name,
}) {
  return Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: border ? Border.all(color: MyHexColors.grey, width: 2) : null,
    ),
    child: MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(name),

    ),
  );
}

Widget makeSeparatorLine() {
  return Container(
    color: MyHexColors.grey,
    height: 1,
  );
}

Widget mySeparated() => Container(
      height: 1,
      color: Colors.grey[300],
    );
