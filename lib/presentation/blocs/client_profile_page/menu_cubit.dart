import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/presentation/blocs/client_profile_page/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuState(tabIndex: 0, isCollapsed: false));

  void changeTabIndex(int index) {
    emit(state.tabIndex == index
        ? const MenuState.empty()
        : MenuState(tabIndex: index, isCollapsed: state.isCollapsed));
  }

  void changeCollapsedState() {
    emit(MenuState(tabIndex: state.tabIndex, isCollapsed: !state.isCollapsed));
  }
}
