import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class fFormDivider extends StatelessWidget {
  const fFormDivider({
    super.key,
     required this.dividerText,
  });
  final String dividerText;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 0,),
        Flexible(child: Divider(color: dark ? fColors.darkerGrey: fColors.grey,thickness: 0.5, indent: 60,endIndent:5,)),
        Text(dividerText,style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ? fColors.darkerGrey: fColors.grey,thickness: 0.5, indent: 5,endIndent:5,),
        )
      ],
    );
  }
}
