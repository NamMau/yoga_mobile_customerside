import 'package:flutter/material.dart';
import '../components/home_app_bar.dart';
import '../components/text_field_widget.dart';
import '../components/tab_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(height: 8), // Small spacing after the app bar
                const Text(
                  'Explore more about Yoga Courses',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8), // Small spacing after the title
                TextFieldWidget(),
                const SizedBox(height: 4), // Small spacing after the text field
                Container(
                  height: h * 0.35,
                  width: w * 0.9,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/b4.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Reduced spacing after the image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text('see all'),
                      SizedBox(width: w*0.22,)
                  ],
                ),

                SizedBox(height: h *0.22), // Small spacing before the TabBarWidget
                const   TabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
