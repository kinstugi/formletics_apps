import 'package:flutter/material.dart';

class BeforeAfterImage extends StatelessWidget {
  final String beforeImage;
  final String afterImage;

  const BeforeAfterImage({this.beforeImage, this.afterImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: const EdgeInsets.only(right: 5),
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              beforeImage,
              height: size.height * 0.2,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5,),
            Image.network(
              afterImage,
              height: size.height * 0.2,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
