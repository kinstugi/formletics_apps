import 'package:flutter/material.dart';

import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/features/tabs/routine/ui/widgets/program_tile.dart';
import 'package:formletics/features/tabs/routine/ui/widgets/trainer_badge.dart';

class ProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(ln(context, "programs")),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrainerBadge(size: size),
            const SizedBox(height: 10),
            Text(
              ln(context, "programs"),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            ProgramTile(
              title: "Subat",
              isActive: true,
              onTap: () {},
            ),
            ProgramTile(
              title: "Ocak",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  int _daysInMonth(String month) {
    final thirtyDayMonth = ["september", "april", "june", "november"];

    if (thirtyDayMonth.contains(month.toLowerCase())) {
      return 30;
    }

    if (month.toLowerCase() == "february") {
      final _date = DateTime.now();
      if (_date.year % 4 == 0) return 29;
      return 28;
    }

    return 31;
  }
}
