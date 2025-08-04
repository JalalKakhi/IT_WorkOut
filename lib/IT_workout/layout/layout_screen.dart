import 'package:IT_workout/IT_workout/layout/cubit/layout_cubit.dart';
import 'package:IT_workout/IT_workout/layout/cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LayoutCubit(),
        child: BlocConsumer<LayoutCubit,LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit=LayoutCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  cubit.titles[cubit.currentIndex].toUpperCase(),
                ),
                actions: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.settings)
                  )
                ],
              ),
              body:Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: cubit.Screens[cubit.currentIndex],
              ),
              bottomNavigationBar: BottomNavigationBar(

                  items: cubit.bottomNavigationItems,
                  currentIndex:cubit.currentIndex,


                  onTap: (index){
                    cubit.changeBottomNavigationBar(index);
                  },
                ),
            );
          }
        ),
      ),
    );
  }
}
