import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formletics/common/di/di.dart';
import 'package:formletics/common/enums/state_status.dart';
import 'package:formletics/features/search/ui/stores/search_store.dart';
import 'package:formletics/features/tabs/gym/ui/pages/gym_detail.dart';
import 'package:formletics/features/tabs/trainer/ui/pages/trainer_detail.dart';
import 'package:formletics/widgets/list_item_card/list_item_card.dart';
import 'package:formletics/widgets/searchbar/search_page_appbar.dart';

enum TypeOfSearch {
  GymSearch,
  TrainerSearch,
  GeneralSearch
}

class SearchPage extends StatefulWidget {
  final TypeOfSearch type;

  const SearchPage({@required this.type});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  SearchStore _searchStore = getIt<SearchStore>();
  String _searchQuery = "";

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchPageAppBar(onSearch: _onSearch,),
      body: SearchResultWidget(
        store: _searchStore,
        typeOfSearch: widget.type,
      ),
    );
  }
  
  void _getData(){
    if ( widget.type == TypeOfSearch.GymSearch ){
      if (_searchStore.isSucceedAllGyms != StateStatus.SUCCESS){
        _searchStore.getAllGyms(); 
      }
    }else if ( widget.type == TypeOfSearch.TrainerSearch ){
      if (_searchStore.isSucceedAllTrainers != StateStatus.SUCCESS) {
        _searchStore.getAllTrainers();
      }
    }else{
      
    }
  }

  void _onSearch(String query){
    if (widget.type == TypeOfSearch.TrainerSearch){
      _searchStore.searchTrainers(query);
    }else {
      _searchStore.searchGyms(query);
    }
  }

}


class SearchResultWidget extends StatelessWidget {
  final SearchStore store;
  final TypeOfSearch typeOfSearch;

  const SearchResultWidget({@required this.store, this.typeOfSearch});

  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (_){
        if (typeOfSearch == TypeOfSearch.GymSearch){
          if (store.gymSearchResults.isEmpty){
            return const Center(
              child: Text("no gyms found"),
            );
          }
        } else if (typeOfSearch == TypeOfSearch.TrainerSearch){
          if (store.trainerSearchResults.isEmpty){
            return const Center(
              child: Text("no trainers found"),
            );
          }
        }

        if (typeOfSearch == TypeOfSearch.TrainerSearch){
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            itemCount: store.trainerSearchResults.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            itemBuilder: (ctx,i){
              final model = store.trainerSearchResults[i];
              return ListItemCard(
                padding: const EdgeInsets.all(0),
                title: model.name,
                aspectRatio: 1,
                photoUrl: model.photo ?? 'https://placeimg.com/640/360/54',
                topLeftIcon: const Icon(
                  Icons.verified_user,
                  size: 16,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                ),
                topRightIcon: const Icon(
                  Icons.verified_user,
                  size: 16,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                ),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=> TrainerDetailWidget(
                      trainerId: model.id,
                    ))
                  );
                },
              );
            }
          );
        }else{
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            itemCount: store.gymSearchResults.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            itemBuilder: (ctx, i){
              final model = store.gymSearchResults[i];
              return ListItemCard(
                padding: const EdgeInsets.all(0),
                title: model.name,
                subtitle: model.mahalle ?? model.il,
                aspectRatio: 1,
                photoUrl: model.photo ?? 'https://placeimg.com/640/360/54',
                topLeftIcon: const Icon(
                  Icons.verified_user,
                  size: 16,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                ),
                topRightIcon: const Icon(
                  Icons.verified_user,
                  size: 16,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                ),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=> GymDetailWidget(
                      gymId: model.id,
                    ))
                  );
                },
              );
            }
          );
        }
      },
    );
  }
}

