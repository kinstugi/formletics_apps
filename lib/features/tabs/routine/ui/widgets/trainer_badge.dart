import 'package:flutter/material.dart';

class TrainerBadge extends StatelessWidget {
  const TrainerBadge({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: size.height * 0.13,
          width: size.height * 0.12,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://bit.ly/3cXA4S4'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            height: size.height * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 25),
                Text(
                  "A.eraslan",
                  style: Theme.of(context).textTheme.headline6.copyWith(),
                ),
                const SizedBox(height: 5),
                Text(
                  "Personal Trainer",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.white38,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Chip(
                      label: const Icon(Icons.mail),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                    const SizedBox(width: 10),
                    Chip(
                      label: const Icon(Icons.phone),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(0),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
