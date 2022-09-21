import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

import '../../../../../common/provider/local_provider.dart';
import '../../../../../common/widget/tedt_flexible_body.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget(
      {Key? key, this.onTap, required this.locale, this.border})
      : super(key: key);
  final Function()? onTap;
  final Border? border;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LocalizationProvider.of(context).changeLocale(locale.languageCode);
      },
      child: Container(
        height: 50.h,
        margin: REdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: LocalizationProvider.of(context).local == locale
              ? Border.all(color: AppColors.orange)
              : Border.all(
                  color: Theme.of(context).disabledColor.withOpacity(.2)),
          borderRadius: PBorderRadius.borderRadiusAllM1,
        ),
        child: Row(
          children: [
            Space.hS2,
            RPadding(
              padding: REdgeInsets.only(left: 2),
              child: Align(
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: PBorderRadius.borderRadiusAllM1,
                    child: Image.asset(
                      getImage(context, locale),
                      height: 20.h,
                      width: 20.w,
                    )),
                //
                //
                //
              ),
            ),
            Space.hS2,
            TextFlexibleBody(flex: 5, text: locale.toLanguageTag()),
          ],
        ),
      ),
    );
  }

  String getImage(BuildContext context, Locale current) {
    if (current == const Locale('en')) {
      return 'packages/intl_phone_field/assets/flags/us.png';
    }
    if (current == const Locale('ar')) {
      return 'packages/intl_phone_field/assets/flags/sa.png';
    }
    if (current == const Locale('tr')) {
      return 'packages/intl_phone_field/assets/flags/tr.png';
    }
    return 'packages/circle_flags/assets/png/tr.png';
  }
}
