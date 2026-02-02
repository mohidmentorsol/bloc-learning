import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/fav%20bloc/fav_events.dart';
import 'package:bloc_learning/bloc/fav%20bloc/fav_states.dart';
import 'package:bloc_learning/repository/fav_repo.dart';
import 'package:bloc_learning/ui/models/fav_item_model.dart';

class FavBloc extends Bloc<FavEvent, FavStates> {
  List<FavItemModel> myFavItems = [];
  List<FavItemModel> tempFavItems = [];

  FavRepo favRepo;
  FavBloc(this.favRepo) : super(const FavStates()) {
    on<LoadFavItemsEvent>(loadFavItems);
    on<AddFavItem>(_addFavItem);
    on<ToggleFavItem>(_toggleSelectedItem);
    on<DeSelectAllItem>(_deSelectAllItems);
    on<DeleteSelectedItems>(_deleteSelectedItems);
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

  void _toggleSelectedItem(ToggleFavItem event, Emitter<FavStates> emit) {
    final updatedList = List<FavItemModel>.from(state.favItems);

    final index = updatedList.indexWhere((e) => e.id == event.item.id);

    if (index != -1) {
      final current = updatedList[index];

      updatedList[index] = current.copyWith(isSelected: !current.isSelected);
    }

    emit(state.copyWith(favItems: updatedList));
  }

  void _deSelectAllItems(DeSelectAllItem event, Emitter<FavStates> emit) {
    final updatedList = state.favItems.map((item) {
      return item.isSelected ? item.copyWith(isSelected: false) : item;
    }).toList();

    emit(state.copyWith(favItems: updatedList));
  }

  void _deleteSelectedItems(
    DeleteSelectedItems event,
    Emitter<FavStates> emit,
  ) {
    final updatedList = state.favItems
        .where((item) => !item.isSelected)
        .toList();

    emit(state.copyWith(favItems: updatedList));
  }
}
