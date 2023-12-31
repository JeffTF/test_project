import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_project/bloc/reservation/reservation_bloc.dart';

class BookingTimeDisplay extends StatelessWidget {
  const BookingTimeDisplay({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white38),
          borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      child: Text(
        time,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
      ),
    );
  }
}

class BookingTimeLunch extends StatelessWidget {
  const BookingTimeLunch({super.key, required this.voidCallBack});
  final VoidCallback voidCallBack;

  @override
  Widget build(BuildContext context) {
    List<String> lunchTimeList = [
      '11:00 AM',
      '11:30 AM',
      '12:00 AM',
      '12:30 AM',
      '01:00 PM',
      '01:30 PM',
      '02:00 PM',
      '02:30 PM'
    ];
    return Wrap(
      runAlignment: WrapAlignment.start,
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 8,
      alignment: WrapAlignment.start,
      children: lunchTimeList
          .map((e) => TimeContainer(
                text: e,
                callback: voidCallBack,
              ))
          .toList(),
    );
  }
}

class BookingTimeDinner extends StatelessWidget {
  const BookingTimeDinner({super.key, required this.voidCallback});
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    List<String> dinnerTimeList = [
      '05:00 PM',
      '05:30 PM',
      '06:00 PM',
      '06:30 PM',
      '07:00 PM',
      '07:30 PM',
      '08:00 PM',
      '08:30 PM',
      '09:00 PM',
      '09:30 PM',
      '10:00 PM',
      '10:30 PM',
    ];
    return Wrap(
      runAlignment: WrapAlignment.start,
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 8,
      alignment: WrapAlignment.start,
      children: dinnerTimeList
          .map((e) => TimeContainer(
                text: e,
                callback: voidCallback,
              ))
          .toList(),
    );
  }
}

class TimeContainer extends StatefulWidget {
  const TimeContainer({super.key, required this.text, required this.callback});
  final String text;
  final VoidCallback callback;

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    _selectedTime =
        BlocProvider.of<ReservationBloc>(context).getReservationTime;
    return Container(
        decoration: BoxDecoration(
          color: _selectedTime == timeOfDayConvert(widget.text)
              ? Colors.white
              : Colors.black,
          border: Border.all(color: Colors.deepOrangeAccent.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [BoxShadow(
          //   color: Colors.deepOrangeAccent.withOpacity(0.5),
          //   spreadRadius: 0,
          //   blurRadius: 0,
          //   offset: const Offset(1, 1),
          // )]
        ),
        child: TextButton(
          onPressed: () {
            //2:16 AM
            TimeOfDay? timeOfDay = timeOfDayConvert(widget.text);

            BlocProvider.of<ReservationBloc>(context)
                .setReservationTime(timeOfDay);

            widget.callback();
            print(timeOfDay);
          },
          child: Text(
            widget.text,
            style: TextStyle(
                color: _selectedTime == timeOfDayConvert(widget.text)
                    ? Colors.black
                    : Colors.white,
                fontSize: 12),
          ),
        ));
  }

  TimeOfDay timeOfDayConvert(String text) {
    String hr = text.split(':').first;
    String minute = text.split(':').last.split(' ').first;
    String period = text.split(' ').last;
    TimeOfDay? timeOfDay;
    if (period == 'AM') {
      timeOfDay = TimeOfDay(hour: int.parse(hr), minute: int.parse(minute));
    } else {
      timeOfDay =
          TimeOfDay(hour: int.parse(hr) + 12, minute: int.parse(minute));
    }
    return timeOfDay;
  }
}
