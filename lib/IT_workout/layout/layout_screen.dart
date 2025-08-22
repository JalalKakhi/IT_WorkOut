import 'package:IT_workout/IT_workout/layout/cubit/layout_cubit.dart';
import 'package:IT_workout/IT_workout/layout/cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  int? screenIndex;
  LayoutScreen({this.screenIndex});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LayoutCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                shadowColor: Colors.red,
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(4.0),
                    child: Container(
                      color: Colors.black,
                      height: 1.0,
                    )),
                title: Text(
                  cubit.titles[cubit.currentIndex].toUpperCase(),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: cubit.Screens[
                    screenIndex == null ? cubit.currentIndex : screenIndex!],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomNavigationItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavigationBar(index);
                },
              ),
            );
          }),
    );
  }
}
