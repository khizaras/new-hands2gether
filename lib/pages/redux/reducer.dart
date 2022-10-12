import 'package:hands2gether/pages/redux/actions.dart';
import 'package:hands2gether/pages/redux/app_state.dart';

AppState updateDrinksReducer(AppState state, dynamic action) {
  if (action is UpdateDrinkAction) {
    action.updatedDrink.selected = !action.updatedDrink.selected;

    return AppState(
        drinks: state.drinks
            .map(
              (drink) => drink.name == action.updatedDrink.name
                  ? action.updatedDrink
                  : drink,
            )
            .toList());
  }

  return state;
}
