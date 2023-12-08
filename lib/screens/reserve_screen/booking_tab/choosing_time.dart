import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_project/bloc/reservation/reservation_bloc.dart';
import 'package:my_practice_project/screens/reserve_screen/booking_tab/choosing_date.dart';

import 'booking_time.dart';

class TimePage extends StatefulWidget {
  const TimePage(
      {super.key, required this.continueClick, required this.backToCalendar});

  final Function() continueClick;
  final Function() backToCalendar;

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  TimeOfDay time = const TimeOfDay(hour: 00, minute: 00);
  @override
  Widget build(BuildContext context) {
    time = BlocProvider.of<ReservationBloc>(context).getReservationTime;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 3),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            InkWell(
              onTap: widget.backToCalendar,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      BlocProvider.of<ReservationBloc>(context)
                          .getReservationDate
                          .toString(),
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: Color(0xFFEEEEEE),
              thickness: 1,
              height: 1,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
              child: const Text('Lunch'),
            ),
            BookingTimeLunch(
              voidCallBack: () {
                setState(() {});
              },
            ),
            // Padding(
            //     padding: const EdgeInsets.all(8),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Column(
            //       children: [
            //         GestureDetector(
            //           onTap: () async {await pickTime(context);
            //             },
            //           child:  BookingTimeDisplay(
            //             time: (time.hour == 0? 12 : time.hourOfPeriod).toString(),
            //             ),
            //         ),
            //       ],
            //     )
            //   ],
            // ),),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
              child: const Text('Dinner'),
            ),
            // const Padding(
            //     padding: EdgeInsets.all(8),
            //     child: BookingTime()),
            BookingTimeDinner(
              voidCallback: () {
                setState(() {});
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Button(
                buttonText: 'Continue',
                onTap: widget.continueClick,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> pickTime(BuildContext context) async {
  //   time = await showTimePicker(
  //       context: context,
  //       initialTime: time)?? time ;
  //
  //   if (mounted){
  //     BlocProvider.of<ReservationBloc>(context).setReservationTime(time);
  //   }
  //   setState(() {});
  // }
}
