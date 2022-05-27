import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

class RootState extends Equatable {
  final Future<RecipesContentModel?>? dataRecipes;

  const RootState({
    this.dataRecipes,
  });

  RootState copyWith({
    Future<RecipesContentModel?>? newData,
    String? changedSearch,
  }) =>
      RootState(
        dataRecipes: newData ?? dataRecipes,
      );

  @override
  List<Object?> get props => [dataRecipes ?? 0];
}
