import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/circle_tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var homeData = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 45, left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const AppLargeText(text: 'Discover'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: tabController,
                      labelColor: AppColors.mainColor,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const CircleTabIndicator(
                        color: AppColors.mainColor,
                        radius: 4,
                      ),
                      tabs: const [
                        Tab(text: 'Places'),
                        Tab(text: 'Inspiration'),
                        Tab(text: 'Emotions'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeData.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .getPlaceDetail(homeData[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, right: 15),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${homeData[index].images}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeData.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .getPlaceDetail(homeData[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, right: 15),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${homeData[index].images}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeData.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .getPlaceDetail(homeData[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, right: 15),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${homeData[index].images}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppLargeText(
                        text: 'Explore more',
                        size: 22,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const AppText(
                          text: 'See all',
                          color: AppColors.textColor1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.maxFinite,
                  height: 120,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/${images.keys.elementAt(index)}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(
                            child: AppText(
                              text: 'Kayaking',
                              color: AppColors.textColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
