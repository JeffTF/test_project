import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_practice_project/bloc/bottom_navigation/bottom_nav_bloc.dart';
import 'package:my_practice_project/screens/home_screen.dart';
import 'package:my_practice_project/screens/menu_screen.dart';
import 'package:my_practice_project/screens/point_screen.dart';
import 'package:my_practice_project/screens/profile_screen.dart';
import 'package:my_practice_project/screens/reserve_screen/reserve_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int pageIndex = 0 ;
  int navIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    PointScreen(),
    ReserveScreen(),
    MenuScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: ( context, state){
          if (state is HomeState){
            navIndex = 0 ;
          }
          if (state is PointState){
            navIndex = 1 ;
          }
          if (state is ReserveState){
            navIndex = 2 ;
          }
          if (state is MenuState){
            navIndex = 3 ;
          }
          if (state is ProfileState){
            navIndex = 4 ;
          }
          return BottomAppBar(
            surfaceTintColor: Colors.white,
            shadowColor: Colors.black,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.none,
            child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: navIndex == 0
                      ?const Icon(Icons.home,color: Colors.lightBlue)
                      : const Icon(Icons.home_outlined),
                    // icon: navIndex == 0
                    //     ? SvgPicture.asset('assets/icons/home_fill.svg')
                    //     :SvgPicture.asset('assets/icons/home_outline.svg') ,
                    onPressed: (){
                      BlocProvider.of<BottomNavBloc>(context).add(HomeEvent());
                    },
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  icon:  navIndex == 1
                      ? const Icon(Icons.wallet_giftcard_rounded,color: Colors.lightBlue)
                      : const Icon(Icons.wallet_giftcard_outlined),
                      // icon: navIndex == 1
                      //     ? SvgPicture.asset('assets/icons/point_fill.svg')
                      //     :SvgPicture.asset('assets/icons/point_outline.svg') ,
                      onPressed: (){
                        BlocProvider.of<BottomNavBloc>(context).add(PointEvent());
                      },
                  highlightColor: Colors.transparent,
                  ),
                IconButton(
                   icon:  navIndex == 2
                       ?const Icon(Icons.calendar_month,color: Colors.lightBlue)
                       : const Icon(Icons.calendar_month_outlined),
                      // icon: navIndex == 2
                      //     ? SvgPicture.asset('assets/icons/reserve_fill.svg')
                      //     :SvgPicture.asset('assets/icons/reserve_outline.svg') ,
                      onPressed: (){
                        BlocProvider.of<BottomNavBloc>(context).add(ReserveEvent());
                      },
                   highlightColor: Colors.transparent,
                  ),
                IconButton(
                  icon:  navIndex == 3
                      ?const Icon(Icons.my_library_books_rounded,color: Colors.lightBlue)
                      : const Icon(Icons.my_library_books_outlined),
                    // icon: navIndex == 3
                    //     ? SvgPicture.asset('assets/icons/menu_fill.svg')
                    //     :SvgPicture.asset('assets/icons/menu_outline.svg') ,
                    onPressed: (){
                      BlocProvider.of<BottomNavBloc>(context).add(MenuEvent());
                    },
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  icon:  navIndex == 4
                      ?const Icon(Icons.person,color: Colors.lightBlue)
                      : const Icon(Icons.person_2_outlined),
                    // icon: navIndex == 4
                    //     ? SvgPicture.asset('assets/icons/profile_fill.svg')
                    //     :SvgPicture.asset('assets/icons/profile_outline.svg') ,
                    onPressed: (){
                      BlocProvider.of<BottomNavBloc>(context).add(ProfileEvent());
                    },
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          );
        }
      ),
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (BuildContext context, state){
          if (state is HomeState ){
            pageIndex = 0 ;
          }
          if (state is PointState ){
            pageIndex = 1 ;
          }
          if (state is ReserveState ){
            pageIndex = 2 ;
          }
          if (state is MenuState ){
            pageIndex = 3 ;
          }
          if (state is ProfileState ){
            pageIndex = 4 ;
          }
          return IndexedStack(
            index: pageIndex,
            children: pages,
          );
        },
      ),
    );
  }
}
