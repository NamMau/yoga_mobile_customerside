import 'package:flutter/material.dart';
import 'package:yogacourse/constants/constant_function.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4, // Use 4 tabs
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: h * 0.05,
            child: TabBar(
              unselectedLabelColor: Colors.red,
              labelColor: Colors.white,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: w * 0.012),
              tabs: const [
                TabItem(title: 'Ashtanga yoga'),
                TabItem(title: 'Vinyasa yoga'),
                TabItem(title: 'Restorative Yoga'),
                TabItem(title: 'Hatha Yoga'),
              ],
            ),
          ),
          SizedBox(height: h * 0.2),
          SizedBox(
            height: h * 3,
            child: const TabBarView(
              children: [
                HomeTabBarView(course: 'Yoga dhafha'),
                HomeTabBarView(course: 'Yoga dhafha'),
                HomeTabBarView(course: 'Yoga dhafha'),
                HomeTabBarView(course: 'Yoga dhafha'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 8),
          ),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String course;
  const HomeTabBarView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ConstantFunction.getResponse(course),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No data'),
          );
        }

        return SizedBox(
          height: h * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Map<String, dynamic> snap = snapshot.data![index];
              String categoryName = snap['category_name'];
              String imageUrl = snap['poses'][0]['url_png']; // Use first pose image in poses array

              return Container(
                margin: EdgeInsets.only(right: w * 0.02),
                width: w * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: w * 0.5,
                      height: h * 0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: snapshot.data!.length,
          ),
        );
      },
    );
  }
}
