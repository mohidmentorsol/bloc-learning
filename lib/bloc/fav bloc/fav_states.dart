import 'package:bloc_learning/ui/models/fav_item_model.dart';
import 'package:equatable/equatable.dart';

//
enum ListStatus { loading, success, failure }

//

class FavStates extends Equatable {
  final List<FavItemModel> favItems;

  final ListStatus status;
  const FavStates({this.favItems = const [], this.status = ListStatus.loading});

  FavStates copyWith({List<FavItemModel>? favItems, ListStatus? status}) {
    return FavStates(
      favItems: favItems ?? this.favItems,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [favItems, status];
}
