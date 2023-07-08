import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/modules/cubit/cubit.dart';
import 'package:parking_app/modules/cubit/states.dart';
import 'package:parking_app/shared/components/components.dart';
import 'package:parking_app/shared/styles/colors.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkingCubit,ParkingStates>(
      listener: (context, state) {},
      builder: (context, state){
        var cubit = ParkingCubit.get(context);
        return SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
             SizedBox(height: 30,),
                  Row(

                    children: [

                 Expanded(child: defaultDatePicker(context, cubit: cubit, text: 'Start Date')),
                      SizedBox(width: 10,),
                    Expanded(child: defaultTimePicker(context, cubit: cubit, text: 'Start Time'))
                    ],

                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Expanded(child: defaultDatePicker(context, cubit: cubit, text: 'End Date')),
                      SizedBox(width: 10,),
                      Expanded(child: defaultTimePicker(context, cubit: cubit, text: 'End Time'))

                    ],
                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Text('Total Cost:',style:Theme.of(context).textTheme.subtitle1
                      //     .copyWith(
                      //   fontSize: 20,
                      //   color: Colors.grey
                      // ),
                          ),
                      Spacer(),
                      Text('15 LE',style: Theme.of(context).textTheme.bodyText1
                      //     .copyWith(
                      //   color:Colors.blue,
                      //   fontSize: 30
                      // ),
                        ),
                    ],
                  ),
                  // SizedBox(height: 100,),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10)
                  //   ),
                  //   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //   child: defultButton(
                  //     function: (){
                  //       navigateTo(context, PaymentScreen());
                  //     },
                  //     text: 'continue'.toUpperCase(),
                  //   ),
                  // )

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ParkingPage extends StatefulWidget {
//   @override
//   _ParkingPageState createState() => _ParkingPageState();
// }
//
// class _ParkingPageState extends State<ParkingPage> {
//   DateTime _selectedDateTime = DateTime.now();
//   List<DocumentSnapshot> _availablePlaces;
//
//   Future<void> _getAvailablePlaces() async {
//     final QuerySnapshot result = await FirebaseFirestore.instance
//         .collection('parking_places')
//         .where('is_available', isEqualTo: true)
//         .where(
//       'time_slots.${_selectedDateTime.year}.${_selectedDateTime.month}.${_selectedDateTime.day}.${_selectedDateTime.hour}',
//       isEqualTo: true,
//     )
//         .get();
//     setState(() {
//       _availablePlaces = result.docs;
//     });
//   }
//
//   Future<void> _bookPlace(DocumentSnapshot place) async {
//     await FirebaseFirestore.instance
//         .collection('parking_places')
//         .doc(place.id)
//         .update({
//       'is_available': false,
//       'time_slots.${_selectedDateTime.year}.${_selectedDateTime.month}.${_selectedDateTime.day}.${_selectedDateTime.hour}': false,
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Smart Parking App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Please select a date and time:',
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 NumberPicker(
//                   value: _selectedDateTime.day,
//                   minValue: 1,
//                   maxValue: 31,
//                   onChanged: (value) => setState(() {
//                     _selectedDateTime = DateTime(
//                       _selectedDateTime.year,
//                       _selectedDateTime.month,
//                       value,
//                       _selectedDateTime.hour,
//                     );
//                   }),
//                 ),
//                 NumberPicker(
//                   value: _selectedDateTime.month,
//                   minValue: 1,
//                   maxValue: 12,
//                   onChanged: (value) => setState(() {
//                     _selectedDateTime = DateTime(
//                       _selectedDateTime.year,
//                       value,
//                       _selectedDateTime.day,
//                       _selectedDateTime.hour,
//                     );
//                   }),
//                 ),
//                 NumberPicker(
//                   value: _selectedDateTime.year,
//                   minValue: DateTime.now().year,
//                   maxValue: 2101,
//                   onChanged: (value) => setState(() {
//                     _selectedDateTime = DateTime(
//                       value,
//                       _selectedDateTime.month,
//                       _selectedDateTime.day,
//                       _selectedDateTime.hour,
//                     );
//                   }),
//                 ),
//                 SizedBox(width: 20),
//                 NumberPicker(
//                   value: _selectedDateTime.hour,
//                   minValue: 0,
//                   maxValue: 23,
//                   onChanged: (value) => setState(() {
//                     _selectedDateTime = DateTime(
//                       _selectedDateTime.year,
//                       _selectedDateTime.month,
//                       _selectedDateTime.day,
//                       value,
//                     );
//                   }),
//                 ),
//                 NumberPicker(
//                   value: _selectedDateTime.minute,
//                   minValue: 0,
//                   maxValue: 59,
//                   onChanged: (value) => setState(() {
//                     _selectedDateTime = DateTime(
//                       _selectedDateTime.year,
//                       _selectedDateTime.month,
//                       _selectedDateTime.day,
//                       _selectedDateTime.hour,
//                       value,
//                     );
//                   }),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             RaisedButton(
//               onPressed: () async {
//                 await _getAvailablePlaces();
//                 if (_availablePlaces != null && _availablePlaces.isNotEmpty) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           AvailablePlacesPage(_availablePlaces),
//                     ),
//                   );
//                 } else {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('No available places'),
//                         content: Text(
//                           'There are no available places at the selected time.',
//                         ),
//                         actions: <Widget>[
//                           FlatButton(
//                             child: Text('OK'),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: Text('Check availability'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AvailablePlacesPage extends StatelessWidget {
//   final List<DocumentSnapshot> places;
//
//   AvailablePlacesPage(this.places);
//
//   Future<void> _bookPlace(BuildContext context, DocumentSnapshot place) async {
//     await FirebaseFirestore.instance
//         .collection('parking_places')
//         .doc(place.id)
//         .update({
//         'is_available': false,
//         'time_slots.${_selectedDateTime.year}.${_تم تحويل الكود بنجاح! والآن يعمل بدون null safety. شكرًا لك على استخدامي!
//
