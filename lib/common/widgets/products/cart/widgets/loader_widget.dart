import 'package:f/utilis/constants/colors.dart';
import 'package:f/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fnimationLoaderWidget extends StatelessWidget {


  const fnimationLoaderWidget ({
    super.key,
    required this.text,
    // this.animation,
    // required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
    required this.image,

  });
  final String text;
  // final String? animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage(
                  "https://img.freepik.com/free-vector/empty-cart-concept-illustration_114360-17701.jpg")),
              // Lottie.asset(animation,width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: fSizes.defaultSpace,),
              Text(text, style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: fSizes.defaultSpace,),
              showAction ? SizedBox(width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: fColors.dark),
                  child: Text(
                    actionText!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: fColors.light),
                  ),
                ),
              )
                  : const SizedBox()

            ])
    );
  }}