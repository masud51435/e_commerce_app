import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utlities.dart';
import '../curver_widge/curved_widget.dart';
import 'circularContainer.dart';

class AppPrimaryHeader extends StatelessWidget {
  const AppPrimaryHeader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final height = AppDeviceUtils.getScreenHeight();
    final width = AppDeviceUtils.getScreenWidth();
    return AppCurvedWidget(
      child: Container(
        color: AppColor.primaryColor,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: -120,
              right: -250,
              child: Transform.rotate(
                angle: 0.55,
                child: CircularContainer(
                  height: height * 0.4,
                  width: width * 0.9,
                  radius: 50,
                  color: AppColor.white.withOpacity(
                    0.1,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: -260,
              child: Transform.rotate(
                angle: -0.62,
                child: CircularContainer(
                  height: height * 0.4,
                  width: width * 0.9,
                  radius: 50,
                  color: AppColor.white.withOpacity(
                    0.1,
                  ),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
