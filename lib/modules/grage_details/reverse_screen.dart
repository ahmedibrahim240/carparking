import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/modules/cubit/cubit.dart';
import 'package:parking_app/modules/cubit/states.dart';
import 'package:parking_app/modules/layout/layout_screen.dart';
import 'package:parking_app/modules/reverse/spot.dart';
import 'package:parking_app/modules/reverse/time.dart';
import 'package:parking_app/shared/components/components.dart';
import 'package:parking_app/shared/styles/colors.dart';

class ReverseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit, ParkingStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () {
                        navigateTo(context, LayoutScreen());
                      },
                    ),
                    Text(
                      'Reverse Your Spot',
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                  ],
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.access_time_rounded,
                        color: defaultColor,
                      ),
                      text: 'Time',
                    ),
                    Tab(
                      icon: Icon(Icons.local_parking_rounded,
                          color: defaultColor),
                      text: 'Spot',
                    ),
                    //Tab(icon:Icon(Icons.payment,color: defaultColor),text: 'Payment',)
                  ],
                ),
              ),
              body: TabBarView(children: [
                TimeScreen(),
                SpotScreen(),
                //PaymentScreen()
              ])),
        );
      },
    );
  }
}
