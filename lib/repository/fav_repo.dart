import 'package:bloc_learning/ui/models/fav_item_model.dart';

class FavRepo {
  Future<List<FavItemModel>> getFavItems() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return List.of(_generateFavItems());
  }

  List<FavItemModel> _generateFavItems() {
    return List<FavItemModel>.generate(
      10,
      (index) =>
          FavItemModel(id: index.toString(), title: 'Favorite Item $index'),
    );
  }
}
