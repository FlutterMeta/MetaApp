import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/presentation/blocs/client_profile_page/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit()
      : super(MenuState(
          tabIndex: 0,
          isCollapsed: false,
          scaffoldKey: GlobalKey<ScaffoldState>(),
        ));

  void changeTabIndex(int index) {
    emit(MenuState(
      tabIndex: index,
      isCollapsed: state.isCollapsed,
      scaffoldKey: state.scaffoldKey,
    ));
  }

  void changeCollapsedState() {
    emit(MenuState(
      tabIndex: state.tabIndex,
      isCollapsed: !state.isCollapsed,
      scaffoldKey: state.scaffoldKey,
    ));
  }
}
