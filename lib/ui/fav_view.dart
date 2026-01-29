import 'package:bloc_learning/bloc/fav%20bloc/fav_bloc.dart';
import 'package:bloc_learning/bloc/fav%20bloc/fav_events.dart';
import 'package:bloc_learning/bloc/fav%20bloc/fav_states.dart';
import 'package:bloc_learning/ui/models/fav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  initState() {
    super.initState();
    context.read<FavBloc>().add(LoadFavItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite View'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),
        ],
      ),
      body: BlocBuilder<FavBloc, FavStates>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(
                child: Text('Failed to load favorite items.'),
              );
            case ListStatus.success:
              if (state.favItems.isEmpty) {
                return const NoData();
              } else {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    final item = state.favItems[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.title),

                        leading: Checkbox(
                          value: item.isSelected,
                          onChanged: (val) {},
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            FavItemModel favItem = FavItemModel(
                              id: item.id,
                              title: item.title,
                              isFavorite: !item.isFavorite,
                            );

                            context.read<FavBloc>().add(AddFavItem(favItem));
                          },
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: item.isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.favItems.length,
                );
              }
          }
        },
      ),
    );
  }
}

//
class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No Favorites Added Yet!'));
  }
}
