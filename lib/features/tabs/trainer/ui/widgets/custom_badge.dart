import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String lead;
  final Widget trailing;
  final Color color;
  final bool showSpacer;

  const CustomBadge({
    this.lead,
    this.trailing,
    this.color,
    this.showSpacer = true
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.zero,
      color: color.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              margin: EdgeInsets.zero,
              color: color.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 4,
                ),
                child: Text(
                  lead,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            trailing,
            if (showSpacer)
              SizedBox(
                width: size.width * 0.120,
              ),
          ],
        ),
      ),
    );
  }
}
