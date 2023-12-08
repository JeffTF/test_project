import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_project/bloc/reservation/reservation_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
   DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    _selectedDay = BlocProvider.of<ReservationBloc>(context).getReservationDate;
    return TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 100)),
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(fontSize: 12),
        todayTextStyle: TextStyle(fontSize: 12),
        holidayTextStyle: TextStyle(fontSize: 12),
        outsideTextStyle: TextStyle(fontSize: 12),
        weekendTextStyle: TextStyle(fontSize: 12),
      ),
      calendarFormat: _calendarFormat,
      headerStyle: const HeaderStyle(
        headerPadding: EdgeInsets.all(1),
        formatButtonVisible: false,
        leftChevronMargin: EdgeInsets.fromLTRB(1, 10, 1, 10),
        leftChevronPadding: EdgeInsets.all(5),
        rightChevronMargin: EdgeInsets.all(0),
        rightChevronPadding: EdgeInsets.all(5),
      ),
      selectedDayPredicate: (day){
          return isSameDay (_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });

          BlocProvider.of<ReservationBloc>(context)
              .setReservationDate(selectedDay);
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}
