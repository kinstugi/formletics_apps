import 'package:flutter/material.dart';
import 'package:formletics/common/l10n/l10n_helpers.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/features/search/ui/pages/search_page.dart';

class CustomAppBar extends StatelessWidget {
  final TypeOfSearch typeOfSearch;

  const CustomAppBar({
    @required this.typeOfSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        color: AppColors.searchBoxColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx)=> SearchPage(type: typeOfSearch)
            ));
          },
          child: Ink(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 14,
                    child: Icon(
                      Icons.search,
                      size: 22,
                      color: AppColors.white,
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 19,
                    child: Text(
                      ln(context, 'search'),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 14,
                    child: Icon(
                      Icons.filter_list,
                      size: 22,
                      color: AppColors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
