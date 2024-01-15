class Branch {
  String id;
  String name;
  String location;
  String openingHours;
  String imageAsset;
  List<Menu> menuList;

  Branch({
    required this.id,
    required this.name,
    required this.location,
    required this.openingHours,
    required this.imageAsset,
    required this.menuList,
  });
}

class Menu {
  String id;
  String name;
  double price;
  String imageAsset;

  Menu({
    required this.id,
    required this.name,
    required this.price,
    required this.imageAsset,
  });
}

class Comment {
  Branch branch;
  String comments;

  Comment({
    required this.branch,
    required this.comments,
  });
}
