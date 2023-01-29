import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final GestureTapCallback? onTap;

  const ResponsiveButton({
    super.key,
    this.width = 120,
    this.isResponsive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const AppText(
                        text: 'Book Trip Now',
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              Image.asset('assets/img/button-one.png'),
            ],
          ),
        ),
      ),
    );
  }
}
