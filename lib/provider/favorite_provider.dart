import 'package:flutter/material.dart';
import 'package:pempek_candy/models/branch.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Menu> _menuFavorit = [];

  // method get akan dipanggil di halaman profile
  // untuk menampilkan list favorit di halaman profile
  List<Menu> get menu => _menuFavorit;

  // Memasukkan item menu ke dalam list favorit
  void toggleFavorite(Menu menu) {
    final isExist = _menuFavorit.contains(menu);
    if (isExist) {
      _menuFavorit.remove(menu);
    } else {
      _menuFavorit.add(menu);
    }
    notifyListeners();
    // void notifyListeners() Call all the registered listeners.
    // Call this method whenever the object changes,
    // to notify any clients the object may have changed.
    // - flutter docs
  }

  // Apakah menu sudah ada di list favorit atau belum
  // method ini akan dipanggil di branch_menu untuk menentukan warna icon favorit
  bool isExist(Menu menu) {
    final isExist = _menuFavorit.contains(menu);
    return isExist;
  }
}
