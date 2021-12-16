import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:formletics/features/search/ui/stores/search_store.dart';


class SearchPageAppBar extends StatefulWidget  implements PreferredSizeWidget{
  final Function onSearch;

  const SearchPageAppBar({@required this.onSearch});

  @override
  _SearchPageAppBarState createState() => _SearchPageAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}

class _SearchPageAppBarState extends State<SearchPageAppBar> {
  final TextEditingController _controller = TextEditingController();
  bool canClear = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent
            ]
        ),
      ),

      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              suffixIcon: Observer(
                builder: (_){
                  if (canClear) {
                    return IconButton(
                    icon: const Icon(Icons.clear_outlined),
                    color: Colors.white,
                    onPressed: (){
                      _controller.clear();
                      _toggleClear();
                    },
                  );
                  } else {
                    return Container(width: 0.01, height: 0.01,);
                  }
                },
              ),
            ),
            style: const TextStyle(
                fontSize: 40
            ),
            onChanged: (val){
              widget.onSearch(val);
              setState(() {
                canClear = val.isNotEmpty;
              });

            },
          ),
        ),
      ),
    );
  }

  void _toggleClear(){
    setState(() {
      canClear = !canClear;
    });
  }
}