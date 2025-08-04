import 'package:IT_workout/IT_workout/modules/homeGym/homeCubit/home_cubit.dart';
import 'package:IT_workout/IT_workout/modules/homeGym/homeCubit/home_states.dart';
import 'package:IT_workout/IT_workout/modules/planScreen/plan_screen.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
class HomeGym extends StatelessWidget {
  const HomeGym({super.key});

  Widget planSection (
      context,
      {
        String? name,
        String? description
      }
      ) =>Padding(
    padding: const EdgeInsets.symmetric(vertical: 14.0),
    child: Stack(
      children: [
        Container(
          height:MediaQuery.of(context).size.height/4,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: MyHexColors.redGradientColors,
                  end:AlignmentDirectional.bottomStart,
                  begin: AlignmentDirectional.topEnd
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:  AssetImage("assets/icons/muscles.png"),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              HexColor("#DC1C13").withOpacity(0.0),
                              HexColor("#EA4C46").withOpacity(0.0),
                              HexColor("#F07470").withOpacity(0.7),
                              HexColor("#F1959B").withOpacity(1),

                            ],
                            end:AlignmentDirectional.bottomStart,
                            begin: AlignmentDirectional.topEnd
                        )
                    ),
                  )
              ),
            ],
          ),
        ),
        Container(
          height:MediaQuery.of(context).size.height/4,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white)
              ),
              Spacer(),
              Text(
                description!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  onPressed:(){
                    navigate(context, PlanScreen());
                  },
                  color: Colors.white,
                  child: const Text("Start",style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        )
      ],
    ),
  );
  Widget searchSection (context) =>Padding(
    padding: const EdgeInsets.symmetric(vertical: 14.0),
    child: Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height/12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.search,),
          SizedBox(width: 10,),
          Text("Search",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),)
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getPlan(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ConditionalBuilder(
              condition: state is SuccessGetPlanState && cubit.getPlanModel != null && cubit.getPlanModel!.data != null,
              builder: (context) => Column(
                children: [
                  searchSection(context),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                'Challanges',
                                style: Theme.of(context).textTheme.headlineSmall
                            ),
                            planSection(context,name: cubit.getPlanModel?.data?.name, description: cubit.getPlanModel?.data?.description),
                            Text(
                                'Exercises',
                                style: Theme.of(context).textTheme.headlineSmall
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
                      ],
                    ),
                  ),
                ],
              ),
              fallback: (context) =>state is ErrorGetPlanState? Center(child: Text("check your connection"),) : Center(child: CircularProgressIndicator(color: Colors.red,),),
          );

        },

      ),
    );
  }
}
