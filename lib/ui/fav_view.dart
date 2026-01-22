import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
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
      body: true
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Favorite Item $index'),

                    leading: Checkbox(value: index.isEven, onChanged: (val) {}),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outline),
                    ),
                  ),
                );
              },
              itemCount: 10,
            )
          : const NoData(),
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
