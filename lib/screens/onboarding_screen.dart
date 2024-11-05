import 'package:flutter/material.dart';
import 'package:yogacourse/screens/home.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: h * 0.79, // 79% of the screen height
                width: w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/b3.jpg'), // Ensure this path is correct
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset('assets/b2.jpg'), // Ensure this path is correct
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.243, // 24.3% of the screen height
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.032),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Let\'s do exercise',
                          style: TextStyle(
                            fontSize: w * 0.06,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        const Text(
                          'Check the app and start working out with our professionals',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: w * 0.8, // 80% of the screen width
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()));
                              // Define onPressed functionality here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Updated to backgroundColor
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Get started',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
