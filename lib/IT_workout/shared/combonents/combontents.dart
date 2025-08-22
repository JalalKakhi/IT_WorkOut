import 'package:IT_workout/IT_workout/modules/exercisesScreen/exercises_screen.dart';
import 'package:IT_workout/IT_workout/modules/trainingScreen/training_screen.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget WorkoutShape(context,
        {required String image_path,
        required String name,
        required String description}) =>
    InkWell(
      onTap: () {
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
                child: true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 3 * 60 + 2 * 10,
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  makeMaterialButton(
                                    name: "level name",
                                    onPressed: () {
                                      navigate(context, ExercisesScreen());
                                    },
                                    border: true,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: 3),
                        ),
                      )
                    : false
                        ? CircularProgressIndicator(
                            color: Colors.red,
                          )
                        : Center(
                            child: Text("check your connection!"),
                          ),
              ),
            );
          },
        );
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
                image: NetworkImage(image_path),
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
                    name.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
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

void navigate(context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigateAndReplace(context, Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
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
Widget defultTextFormField(
        {var controlar,
        required TextInputType textInputType,
        required String labelText,
        Icon? preIcon,
        bool isObscure = false,
        double? width,
        IconData? sufIcon,
        ValueChanged? onChanged,
        required String? Function(String?) validate,
        Color? colors,
        VoidCallback? suf_function}) =>
    Container(
      width: width,
      child: TextFormField(
        controller: controlar,
        keyboardType: textInputType,
        obscureText: isObscure,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(borderSide: BorderSide(color:colors! )),
            prefixIcon: preIcon,
            suffixIcon:
                IconButton(onPressed: suf_function, icon: Icon(sufIcon))),
        validator: validate,
      ),
    );
Widget defultButtom(
        {double width = double.infinity,
        Color color = Colors.blue,
        Color textcolor = Colors.white,
        required VoidCallback function,
        required String text,
        FontWeight? fontWeight,
        double? fontSize,
        double radius = 0.0,
        TextStyle? textStyle,
        bool isUpper = true}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpper ? text.toUpperCase() : text, style: textStyle),
      ),
    );
    
  Widget datePickerScreen({
    context , 
    required String hintText,
    required String label,
    required TextEditingController controller,
    required bool isObscure,
    required VoidCallback onTap,
    required TextInputType textInputType,
    required String? Function(String?)? validate,
    required VoidCallback setState,
  }) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                 child:
  GestureDetector(
                    onTap: ()async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.red.shade700,
              surface: Colors.black,
            ),
            dialogBackgroundColor: Colors.black.withOpacity(0.9),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      
    }
  },
                    child: AbsorbPointer(
                      child: defultTextFormField(
                        controlar: controller,
                        labelText: hintText,
                        isObscure: isObscure,
                        textInputType:textInputType ,
                         validate: (v){},
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 100, // Maintains alignment with unit dropdowns
            ),
          ],
        ),
      ],
    );

    
  
