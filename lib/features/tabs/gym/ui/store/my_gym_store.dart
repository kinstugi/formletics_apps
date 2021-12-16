import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';


part "my_gym_store.g.dart";

class MyGymStore = _MyGymStore with _$MyGymStore;

abstract class _MyGymStore with Store {

  @observable
  bool showModal = false;

  @observable
  String il;

  @observable
  String ilce;

  @observable
  String semt;

  @observable
  String mahalle;

  SharedPreferences _preference;

  @action
  Future<void> getPreference() async{
    _preference = await SharedPreferences.getInstance();
  }

  Future<bool> _getIl() async{
    il = _preference.getString('il') ?? "";
    print("il >>>>>>>>>>>>>>>>>>>>>"+il);
    return il.isNotEmpty;
  }

  Future<bool> _getIlce() async {
    ilce = _preference.getString('ilce') ?? "";
    return ilce.isNotEmpty;
  }

  Future<bool> _getSemt() async {
    semt = _preference.getString('semt') ?? "";
    return semt.isNotEmpty;
  }

  Future<bool> _getMahalle() async {
    mahalle = _preference.getString('mahalle') ?? "";
    return mahalle.isNotEmpty;
  }

  @action
  Future<bool> checkFilters() async{
    bool _canCheckIl = await _getIl();
    bool _canCheckIlce = await _getIlce();
    bool _canCheckSemt = await _getSemt();
    bool _canCheckMahalle = await _getMahalle();

    var res = !(_canCheckMahalle || _canCheckSemt || _canCheckIl || _canCheckIlce);
    showModal = res;
    return res;
  }

  @action
  Future<bool> saveFilter(Map<String, dynamic> locationData) async {
    bool _res = true;
    locationData.forEach((key, value) async {
      bool _sol = false;
      if (value != null){
        _sol = await _preference.setInt(key, value['id'] as int);
        await _preference.setString('${key}Name', value['name'] as String);
      }
      _res = _res && _sol;
    });
    return _res;
  }
}
