import 'package:flutter/material.dart';
import 'package:f/common/widgets/appbar/appbar.dart';
import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:f/utilis/device/device_utility.dart';


class fRatingProgressIndicator extends StatelessWidget {
  const fRatingProgressIndicator({
    super.key, required this.text, required this.value,

  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex:2,child:  Text(text,style: Theme.of(context).textTheme.bodyMedium,),),
        Expanded(flex: 18,child: SizedBox(
          width: fDeviceUtilis.getScreenWidth(context) * 0.5,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: fColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor: const AlwaysStoppedAnimation(fColors.primary),
          ),

        ))
      ],

    );
  }
}
