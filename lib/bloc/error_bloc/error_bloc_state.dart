import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

class ErrorState extends Equatable {
  final Future<RecipesContentModel?>? dataRecipes;

  const ErrorState({
    this.dataRecipes,
  });

  ErrorState copyWith({
    Future<RecipesContentModel?>? newData,
    String? changedSearch,
  }) =>
      ErrorState(
        dataRecipes: newData ?? dataRecipes,
      );

  @override
  List<Object?> get props => [dataRecipes ?? 0];
}
