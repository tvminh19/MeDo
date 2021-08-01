import 'package:flutter/cupertino.dart';

class small_banner_service extends StatelessWidget {
  final String img_link;
  final double img_width;

  const small_banner_service({
    Key? key,
    required this.img_link,
    required this.img_width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: img_width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:
              DecorationImage(image: AssetImage(img_link), fit: BoxFit.cover)),
    );
  }
}
