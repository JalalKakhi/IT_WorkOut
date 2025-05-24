import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverGym extends StatelessWidget {
  const DiscoverGym({super.key});

  Widget makeCarouselSliderItem({
    required context,
    required String imagePath,
    required String title
  }){
    return Container(
      height: MediaQuery.sizeOf(context).height/1.5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover
        ),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        widthFactor: 1,
        heightFactor: 1/10,
        child: Container(
          color: Colors.grey[200]?.withOpacity(0.5),
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,overflow: TextOverflow.ellipsis,),
            ),
          ),
        ),
      ),
    );
  }
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
              makeCarouselSliderItem(context: context, imagePath: 'assets/images/confident-sportsman-with-headphones-jumping-rope.jpg', title: "jumprope workout"),
              makeCarouselSliderItem(context: context, imagePath: 'assets/images/meal-planning-clipboard-food-arrangement.jpg', title: "make your own diet"),
              makeCarouselSliderItem(context: context, imagePath: 'assets/images/confident-sportsman-with-headphones-jumping-rope.jpg', title: "jumprope workout"),
              makeCarouselSliderItem(context: context, imagePath: 'assets/images/confident-sportsman-with-headphones-jumping-rope.jpg', title: "jumprope workout"),
            ],
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height/1.5,
              initialPage: 0,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Stretches',
            style: Theme.of(context).textTheme.headlineSmall,
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
