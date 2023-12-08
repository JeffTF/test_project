import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_project/bloc/reservation/reservation_bloc.dart';
import 'package:my_practice_project/screens/reserve_screen/booking_tab/choosing_date.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key, required this.backToDate, required this.backToTime, required this.continueClick});

  final Function() backToDate;
  final Function() backToTime;
  final Function() continueClick;

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  DateTime date = DateTime(0);
  TimeOfDay time = const TimeOfDay(hour: 00, minute: 00);
  String notes = '' ;
  int guestCount = 1 ;

  @override
  void initState() {
    date = BlocProvider.of<ReservationBloc>(context).getReservationDate;
    time = BlocProvider.of<ReservationBloc>(context).getReservationTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Date',style: TextStyle(fontSize: 16)),
                  Text(BlocProvider.of<ReservationBloc>(context)
                      .getReservationDate.toString(),
                  style: const TextStyle(fontSize: 16),)
                ],
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                color: Color(0xFFEEEEEE),
                thickness: 1,
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Time',style: TextStyle(fontSize: 16)),
                  Text(BlocProvider.of<ReservationBloc>(context)
                      .getReservationTime.toString(),
                    style: const TextStyle(fontSize: 16),)
                ],
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                color: Color(0xFFEEEEEE),
                thickness: 1,
                height: 1,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('Guests',style: TextStyle(fontSize: 16),),),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 2 ,
                      color: Color(0x33124EA4)
                  )],
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(
                      Icons.remove,
                    ),
                    onPressed: (){
                      if (guestCount < 20){
                        guestCount--;
                        setState(() {});
                      }
                    },
                  ),
                  trailing: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(
                      Icons.add,
                    ),
                    onPressed: (){
                      if (guestCount < 20){
                        guestCount++;
                        setState(() {});
                      }
                    },
                  ),
                  title: Text(
                    "$guestCount", textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Add Note',style: TextStyle(fontSize: 16),)
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Color(0x33124EA4),
                  )],
                  color: Colors.white
                ),
                child: const TextField(
                  maxLength: 100,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                ),
              ),
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
              child: Button(
                  buttonText:'Continue',
                  height: 45,
                  fontSize: 30,
                  onTap: (){
                    widget.continueClick;
                  },
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
