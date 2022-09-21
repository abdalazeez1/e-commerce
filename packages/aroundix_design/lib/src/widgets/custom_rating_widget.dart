// class CustomRatingWidget extends StatelessWidget {
//   const CustomRatingWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar(
//       initialRating: 3,
//       itemSize: 20.r,
//       glowColor: Colors.yellowAccent,
//       direction: Axis.horizontal,
//       allowHalfRating: true,
//       itemCount: 5,
//       ratingWidget: RatingWidget(
//         full: Icon(Icons.star,color: AppColors.orange1,),
//         half: Icon(Icons.star_half_rounded,color: AppColors.orange1),
//         empty: Icon(Icons.star_border_outlined),
//       ),
//       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//       onRatingUpdate: (rating) {
//         print(rating);
//       },
//     );
//   }
// }
