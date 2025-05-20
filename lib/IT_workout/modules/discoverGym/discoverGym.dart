import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverGym extends StatelessWidget {
  const DiscoverGym({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Spicial workout ',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 14.0),
          //   child: Container(height: 250,width: double.infinity,color: Colors.red,),
          // ),
          CarouselSlider(
            items: [
              Container(
                height: MediaQuery.sizeOf(context).height/1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: MyHexColors.redGradientColors)
                ),
                
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/jump-rope-svgrepo-com (1).png'),
                      fit: BoxFit.cover,

                    ),
                    Spacer(),
                    Text(
                      "jump rope exercise",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(height: 100,width: double.infinity,color: Colors.green,),
              Container(height: 100,width: double.infinity,color: Colors.yellow,),
              Container(height: 100,width: double.infinity,color: Colors.black,),
              Container(height: 100,width: double.infinity,color: Colors.blue,),
              Container(height: 100,width: double.infinity,color: Colors.pink,),
            ],
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height/1.5,
              initialPage: 0,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,



            ),
          ),
          Text(
            'Stretches',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 14,),
          ListView.separated(
              shrinkWrap: true,
              physics:ScrollPhysics(parent: BouncingScrollPhysics()) ,
              scrollDirection: Axis.vertical,
              itemBuilder:(context , index) => WorkoutShape(context) ,
              separatorBuilder:(context , index) => SizedBox(height: 10.0,),
              itemCount: 6
          ),
        ],
      ),
    );
  }
}
