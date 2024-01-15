import 'package:flutter/material.dart';
import 'package:pempek_candy/models/branch.dart';

class CommentProvider extends ChangeNotifier {
  final List<Comment> _comment = [];

  // method get akan dipanggil di halaman branch_menu
  List<Comment> get comment => _comment;

  // Memasukkan item comment ke dalam list komentar
  void setComment(Branch branch, String comment) {
    _comment.add(Comment(branch: branch, comments: comment));
    notifyListeners();
  }
}
