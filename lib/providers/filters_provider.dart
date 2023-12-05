import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

//<>
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvier);
  final activeProvider = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeProvider[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeProvider[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeProvider[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeProvider[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
