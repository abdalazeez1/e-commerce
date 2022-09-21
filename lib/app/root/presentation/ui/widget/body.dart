import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/profile/presentation/ui/screen/profile_screen.dart';
import 'package:aroundix_store/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import "package:collection/collection.dart";

import '../../../../../generated/l10n.dart';
import '../../../../product/presentation/ui/screen/add_product.dart';
import '../../../root_manger/root_manger.dart';
import 'package:provider/provider.dart';

import '../widget/nav_icon_animation.dart';
import 'icon_drawer.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootManger = context.watch<RootManger>();
    final selectedIndex = rootManger.pageIndex;
    final s = S.of(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const _RenderFloatingActionButton(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        clipBehavior: Clip.hardEdge,
        child: BottomAppBar(
          color: Theme.of(context).cardColor,
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Builder(
            builder: (context) {
              var sizeIconUnSelected = 24.r;
              return ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: NavigationBar(
                  height: Theme.of(context).navigationBarTheme.height! + 10.h,
                  labelBehavior:
                      NavigationDestinationLabelBehavior.onlyShowSelected,
                  backgroundColor: Theme.of(context).cardColor,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    rootManger.jump(index);
                  },
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.home_outlined,
                        size: sizeIconUnSelected,
                      ),
                      // selectedIcon: FaIcon(FontAwesomeIcons.houseFire),
                      selectedIcon: SizedBox(
                          height: 30.h,
                          child: const FaIcon(FontAwesomeIcons.house)),
                      label: s.home,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.person_outline,
                        size: sizeIconUnSelected,
                      ),
                      selectedIcon: SizedBox(
                          height: 30.h,
                          child: const FaIcon(Icons.person)),
                      label: s.profile,
                    ),
                  ]
                      .mapIndexed((index, element) => NavigationPlayAnimation(
                            index: index,
                            selectedIndex: selectedIndex,
                            child: element,
                          ))
                      .toList(),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        leading: const IconDrawer(),
        title: Text(selectedIndex == 0 ? s.products : s.profile),
        actions: [
          IconButton(
            onPressed: () {
              onLoginLogoutAction(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: context.read<RootManger>().pageController,
        children: const [ProductsScreen(), ProfileScreen()]
            .map((e) => KeepAliveWidget(child: e))
            .toList(),
      ),
    );
  }
}


void onLoginLogoutAction(BuildContext context) {
  context.read<AppMangerBloc>().add(AppMangerLoggedOut());
}

class _RenderFloatingActionButton extends StatelessWidget {
  const _RenderFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.pushNamed(AddProductScreen.name);
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 2.0,
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
