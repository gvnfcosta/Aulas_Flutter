import 'package:flutter/material.dart';

String stringImage =
    'https://flutter.dev/images/catalog-widget-placeholder.png';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar = stringImage;
  String birthDate = 'Data';

  void alterarDados() {
    name = 'Giovanni Costa';
    imgAvatar = stringImage;
    birthDate = '13/09/1970';
    notifyListeners();
  }

  void alterarNome() {
    name = 'D`Cost';

    notifyListeners();
  }
}
