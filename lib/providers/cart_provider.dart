import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/product.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Product>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Product meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((m)=>m.id!=meal.id).toList();
      return false;
    }
    else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Product>>((ref){
  return FavoriteMealsNotifier();
});