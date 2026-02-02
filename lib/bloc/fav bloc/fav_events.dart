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
//

class ToggleFavItem extends FavEvent {
  final FavItemModel item;
  const ToggleFavItem(this.item);

  @override
  List<Object?> get props => [item];
}

class DeSelectAllItem extends FavEvent {
  final List<FavItemModel> items;
  const DeSelectAllItem(this.items);

  @override
  List<Object?> get props => [items];
}

class DeleteSelectedItems extends FavEvent {
  final List<FavItemModel> items;
  const DeleteSelectedItems(this.items);

  @override
  List<Object?> get props => [items];
}
