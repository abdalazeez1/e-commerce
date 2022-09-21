import 'package:aroundix_core/core.dart';
import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/user/domain/entities/response_user_info.dart';
import 'package:aroundix_store/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../injection/service_locator.dart';
import '../../../../product/presentation/ui/widget/featured_producrs.dart';
import '../../state/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocProvider.value(
      value: si<ProfileBloc>()..add(GetUserInfoProfile()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return RPadding(
                padding: REdgeInsets.symmetric(
                    horizontal: horizontalAppPadding, vertical: 8),
                child: PageStateBuilder<ResponseUserInfo>(
                    init: () => const SizedBox(),
                    success: (data) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 24.r,
                                    child: const Icon(Icons.person_outline),
                                  ),
                                  Space.hM1,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.user.fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        data.user.email,
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Space.vM2,
                              (data.user.products?.isNotEmpty ?? false)
                                  ? Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            s.product_you_added_recently,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          Space.vM2,
                                          Expanded(
                                            child: FeaturedProducts(
                                              padding: EdgeInsets.zero,
                                              product: data.user.products ?? [],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(s.you_arent_add_products_yet_pleas_click_on_plus_and_add_new_products_to_show_here,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                        ],
                                      ),
                                    )
                            ]),
                    loading: () => const AppLoading(),
                    error: (exception, error) => FailedWidget(
                        onPressed: () => context
                            .read<ProfileBloc>()
                            .add(GetUserInfoProfile()),
                        message: error),
                    result: state.userInfo,
                    empty: () => const SizedBox()),
              );
            },
          ),
        ),
      ),
    );
  }
}
