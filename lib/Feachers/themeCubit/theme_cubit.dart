import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/utils/colors.dart';
import '../../Core/utils/constant.dart';
import 'models/Enums/themeStateEnum.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
/*
    _loadTheme();
*/
  }

  static ThemeCubit get(context) => BlocProvider.of(context);


  /* Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme != null) {
      emit(theme == 'd' ? ThemeDarkThemeState() : ThemeLightThemeState());
    }
  }*/

  changeTheme(ThemeStateEnum enumThem){
    switch(enumThem){
      case ThemeStateEnum.Initial:
        if(sharedPreferences!.getString('theme') !=null){
          if(sharedPreferences!.getString('theme') =='l'){
/*
            updateGlobalColors(false);
*/
            emit(ThemeLightThemeState());
          }else{
/*
            updateGlobalColors(true);
*/
            emit(ThemeLightThemeState());
          }
        }else{
          emit(ThemeLightThemeState());
        }

        break;

      case ThemeStateEnum.Light:
        sharedPreferences!.setString('theme', 'l');
/*
        updateGlobalColors(false);
*/

        emit(ThemeLightThemeState());
        break;
      case ThemeStateEnum.Dark:
        sharedPreferences!.setString('theme', 'd');
        // updateGlobalColors(true);
        emit(ThemeDarkThemeState());
        break;

    }
  }

}
