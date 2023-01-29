import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../cubit/app_cubit_states.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          DetailState detail = state as DetailState;
          return SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${detail.place.images}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.drag_indicator,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 280,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 22),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black87,
                            ),
                            AppLargeText(
                              text: '\$ ${detail.place.price}',
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: detail.place.stars <= index
                                      ? AppColors.mainTextColor
                                      : AppColors.starColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const AppText(
                              text: '(5.0)',
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const AppLargeText(
                          text: 'People',
                          color: Colors.black87,
                          size: 20,
                        ),
                        const SizedBox(height: 5),
                        const AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                child: AppButton(
                                  size: 50,
                                  textColor: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black87,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black87
                                      : AppColors.buttonBackground,
                                  borderColor: AppColors.buttonBackground,
                                  text: '${index + 1}',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const AppLargeText(
                          text: 'Description',
                          color: Colors.black87,
                          size: 20,
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      const AppButton(
                        size: 60,
                        textColor: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                      ),
                      const SizedBox(width: 20),
                      ResponsiveButton(
                        isResponsive: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
