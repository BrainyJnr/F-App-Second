import 'package:f/features/personalization/screens/product_reviews/widget/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class fOverallProdutRating extends StatelessWidget {
  const fOverallProdutRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child:
          Text("4.8",style: Theme.of(context).textTheme.displayLarge,),),
        Expanded(
            flex: 7,
            child: Column(
              children: [
                fRatingProgressIndicator(text: '5', value: 1.0,),
                fRatingProgressIndicator(text: '4', value:0.8 ,),
                fRatingProgressIndicator(text: '3', value:0.6 ,),
                fRatingProgressIndicator(text: '2', value:0.4 ,),
                fRatingProgressIndicator(text: '1', value:0.2 ,),
              ],
            )
        ) ],
    );
  }
}
