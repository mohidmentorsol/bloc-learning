import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/fav%20bloc/fav_events.dart';
import 'package:bloc_learning/bloc/fav%20bloc/fav_states.dart';
import 'package:bloc_learning/repository/fav_repo.dart';
import 'package:bloc_learning/ui/models/fav_item_model.dart';

class FavBloc extends Bloc<FavEvent, FavStates> {
  List<FavItemModel> myFavItems = [];
  FavRepo favRepo;
  FavBloc(this.favRepo) : super(const FavStates()) {
    on<LoadFavItemsEvent>(loadFavItems);
    on<AddFavItem>(_addFavItem);
  }

  void loadFavItems(LoadFavItemsEvent event, Emitter<FavStates> emit) async {
    myFavItems = await favRepo.getFavItems();
    emit(
      state.copyWith(
        status: ListStatus.success,
        favItems: List.from(myFavItems),
      ),
    );
  }

  void _addFavItem(AddFavItem event, Emitter<FavStates> emit) async {
    final itemIndex = myFavItems.indexWhere((item) => item.id == event.item.id);

    if (itemIndex != -1) {
      myFavItems[itemIndex] = event.item;
    }
    emit(state.copyWith(favItems: List.from(myFavItems)));
  }
}
