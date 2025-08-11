import 'package:IT_workout/IT_workout/layout/cubit/layout_states.dart';
import 'package:IT_workout/IT_workout/modules/activityScreen/activity_screen.dart';
import 'package:IT_workout/IT_workout/modules/discoverGym/discoverGym.dart';
import 'package:IT_workout/IT_workout/modules/homeGym/homeGym.dart';
import 'package:IT_workout/IT_workout/modules/setting/setting.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LayoutCubit extends BaseCubit<LayoutStates>{
  LayoutCubit():super(InitialLayoutState());

  static LayoutCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List <BottomNavigationBarItem>bottomNavigationItems=const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'Discover',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Activity',
    ),
     BottomNavigationBarItem(
     icon: Icon(Icons.settings),
     label: 'Setting',
    ),
  ] ;
  List<Widget> Screens=[
    const HomeGym(),
    const DiscoverGym(),
    ActivityScreen(),
    Setting(),
  ];
  void changeBottomNavigationBar(index){
    currentIndex=index;
    emit(ChangeBottomNavigationState());
  }
  List<String> titles=[
    "home workout",
    "special workout",
    "activity",
    "setting"
  ];


}