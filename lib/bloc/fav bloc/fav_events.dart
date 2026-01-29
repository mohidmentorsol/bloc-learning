import 'package:bloc_learning/ui/models/fav_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavEvent extends Equatable {
  const FavEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavItemsEvent extends FavEvent {}

class AddFavItem extends FavEvent {
  final FavItemModel item;
  const AddFavItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveFavItem extends FavEvent {
  final FavItemModel item;
  const RemoveFavItem(this.item);

  @override
  List<Object?> get props => [item];
}
