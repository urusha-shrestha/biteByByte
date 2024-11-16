class IngredientListClass {
  String ingredientName;
  int count;

  IngredientListClass({required this.ingredientName, required this.count});
}

List<IngredientListClass> ingredientList=[
  IngredientListClass(ingredientName: 'Onion', count: 2),
  IngredientListClass(ingredientName: 'Egg', count: 3),
  IngredientListClass(ingredientName: 'Chicken', count: 1),
  IngredientListClass(ingredientName: 'Mushroom', count: 2),
  IngredientListClass(ingredientName: 'Apple', count: 3),
  IngredientListClass(ingredientName: 'Orange', count: 2),];