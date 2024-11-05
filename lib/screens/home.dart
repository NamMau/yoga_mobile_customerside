import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'home_screen.dart';

class Home  extends StatefulWidget { //stful
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController(initialPage: currentIndex);

  }

  @override
  void  dispose(){
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomNavBar(onTap:(index){
       pageController.animateToPage(
           index,
           duration: const Duration(milliseconds: 300),
           curve: Curves.easeInOut);
       setState(() {
         currentIndex=index;
       });
    },
        SelectedItem: currentIndex),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const[
          HomePage(),
          Center(child: Text('Page 2'),),
          Center(child: Text('Page 3'),),
          Center(child: Text('Page 4'),),
          Center(child: Text('Page 5'),)
        ],
      ),

    ); //Scaffold
  }
}
