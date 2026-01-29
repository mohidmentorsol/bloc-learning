import 'package:equatable/equatable.dart';

class FavItemModel extends Equatable {
  final String id;
  final String title;
  bool isFavorite;
  bool isSelected = false;

  FavItemModel({
    required this.id,
    required this.title,
    this.isFavorite = false,
    this.isSelected = false,
  });

  FavItemModel copyWith({
    String? id,
    String? title,
    bool? isFavorite,
    bool? isSelected,
  }) {
    return FavItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, title, isFavorite, isSelected];
}
