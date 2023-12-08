import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_practice_project/screens/reserve_screen/booking_tab/choosing_date.dart';
import 'package:my_practice_project/screens/reserve_screen/main_reserve_screen.dart';

class ReserveTab extends StatelessWidget {
  const ReserveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: Image.asset('assets/images/calendar.png'),
        ),
        const Text('UPCOMING',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/booked.svg',height: 40),
                const Text('---')
              ],
            ),
            SvgPicture.asset('assets/icons/divider.svg'),
            // const VerticalDivider(
            //   width: 10,
            //   thickness: 10,
            //   indent: 40,
            //   color: Colors.black,
            // ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/clock.svg',height: 40),
                const Text('---')
              ],
            ),
            SvgPicture.asset('assets/icons/divider.svg'),
            // const VerticalDivider(
            //   //thickness: 10,
            //   indent: 40,
            //   thickness: 2,
            //   color: Colors.black,
            // ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/guests.svg',height: 40),
                const Text('---')
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SizedBox(
            height: 55,
            child: ListTile(
              // horizontalTitleGap: 50,
              //minLeadingWidth: 100,
              tileColor: const Color(0xFF303030),
              contentPadding: const EdgeInsets.only(left: 24,right: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: const Text('Reserve Now',style: TextStyle(color: Colors.white,fontSize: 14),),
              leading: SvgPicture.asset('assets/icons/booking_icon.svg',),
              trailing:IconButton(icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,) ,
              //subtitle: IconButton(icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainReserveScreen()));
                },),
            ),
          ),
        ),
      ],
    );
  }
}
