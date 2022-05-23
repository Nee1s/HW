import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

class RootState extends Equatable {
  final Future<RecipesContentModel?>? dataRecipes;

  final String? search;

  const RootState({
    this.dataRecipes,
    this.search = '',
  });

  RootState copyWith({
    Future<RecipesContentModel?>? newData,
    String? changedSearch,
  }) =>
      RootState(
        dataRecipes: newData ?? dataRecipes,
        search: changedSearch ?? search,
      );

  @override
  List<Object?> get props => [dataRecipes ?? 0, search ?? 0];
}
