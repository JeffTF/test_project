import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_practice_project/bloc/reservation/reservation_bloc.dart';
import 'package:my_practice_project/screens/reserve_screen/booking_tab/choosing_date.dart';
import 'package:my_practice_project/screens/reserve_screen/booking_tab/choosing_time.dart';

class MainReserveScreen extends StatefulWidget {
  const MainReserveScreen({super.key});

  @override
  State<MainReserveScreen> createState() => _MainReserveScreenState();
}

class _MainReserveScreenState extends State<MainReserveScreen> {
  final PageController pageController = PageController();
  double lineWidth = 0 ;
  bool isDateStep = false;
  bool isTimeStep = false;
  bool isGuestStep = false;
  bool isConfirmStep = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          BlocProvider.of<ReservationBloc>(context).add(ReservationInitialEvent());
          Navigator.pop(context);
          return true ;
        },
        child:Scaffold(
          appBar: AppBar(
            title: const Text('Reserve a Table'),
          ),
          body: Column(
            children: [
              Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      DateTime selectedDate =
                      BlocProvider.of<ReservationBloc>(context).getReservationDate;
                      if(selectedDate.year !=0){
                        animatedToPage(0);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/date_step.svg'),
                            StepLineContainer(
                                lineWidth: lineWidth, isStep: isTimeStep)
                          ],
                        ),
                        const StepperText(
                            text: 'date',
                            isStep: true)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      isTimeStep = true ;
                      animatedToPage(1);
                      setState(() {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            isTimeStep
                                ? SvgPicture.asset('assets/icons/time_step.svg')
                                : SvgPicture.asset('assets/icons/time_unstep.svg'),
                            StepLineContainer(lineWidth: lineWidth, isStep: isGuestStep)
                          ],
                        ),
                        StepperText(
                            text: 'time',
                            isStep: isTimeStep)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(isTimeStep){
                        isGuestStep = true;
                        animatedToPage(2);
                        setState(() {});
                      }
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            isGuestStep
                                ? SvgPicture.asset('assets/icons/guest_step.svg')
                                :SvgPicture.asset('assets/icons/guest_unstep.svg'),
                          ],
                        ),
                        StepperText(
                            text: 'guest',
                            isStep: isGuestStep)
                      ],
                    ),
                  ),
                ],
              ),
              ),
              Expanded(child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index){},
                children: [
                  CalendarPage(
                    continueClick: (){
                      stepToTime(context);
                    }
                  ),
                  TimePage(
                    continueClick: () { stepToGuest(context); },
                    backToCalendar: () {  },
                  ),
                ],
              ))
            ],
          ),
        )
    );
  }
  void stepToTime(BuildContext context) {
    DateTime selectedDate =
        BlocProvider.of<ReservationBloc>(context).getReservationDate;

    if (selectedDate.year != 0) {
      animatedToPage(1);
      isTimeStep = true;
      setState(() {});
    }
  }

  void stepToGuest(BuildContext context) {
    TimeOfDay selectedTime =
        BlocProvider.of<ReservationBloc>(context).getReservationTime;

    animatedToPage(2);
    isGuestStep = true;
    setState(() {});
  }
  void animatedToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }
}

class StepLineContainer extends StatelessWidget {
  const StepLineContainer({
    super.key,
    required this.lineWidth,
    required this.isStep,
  });

  final double lineWidth;
  final bool isStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: lineWidth,
      decoration: BoxDecoration(
        color: isStep ? Colors.black38 : Colors.white,
      ),
    );
  }
}

class StepperText extends StatelessWidget {
  const StepperText({
    super.key,
    required this.text,
    required this.isStep,
  });
  final String text;
  final bool isStep;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(
                color: isStep ? Colors.black38: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
