// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `OR Do You Have An Account?`
  String get or_do_you_have_an_account {
    return Intl.message(
      'OR Do You Have An Account?',
      name: 'or_do_you_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Login Account `
  String get login_account {
    return Intl.message(
      'Login Account ',
      name: 'login_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcome_back {
    return Intl.message(
      'Welcome Back !',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `enter password`
  String get enter_password {
    return Intl.message(
      'enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `or Create New Account!`
  String get or_create_new_account {
    return Intl.message(
      'or Create New Account!',
      name: 'or_create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Hallo !`
  String get hallo {
    return Intl.message(
      'Hallo !',
      name: 'hallo',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get enter_name {
    return Intl.message(
      'Enter Name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enter_email {
    return Intl.message(
      'Enter Email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email valid`
  String get enter_valid_email {
    return Intl.message(
      'Enter Email valid',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `submit password`
  String get submit_password {
    return Intl.message(
      'submit password',
      name: 'submit_password',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `this field is required `
  String get required {
    return Intl.message(
      'this field is required ',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Switch Mode`
  String get switch_mode {
    return Intl.message(
      'Switch Mode',
      name: 'switch_mode',
      desc: '',
      args: [],
    );
  }

  /// `You Can Add Any Thing To Cart Shopping And Order When You Want`
  String get you_can_add_any_thing_to_cart_shopping_and_order_when_you_want {
    return Intl.message(
      'You Can Add Any Thing To Cart Shopping And Order When You Want',
      name: 'you_can_add_any_thing_to_cart_shopping_and_order_when_you_want',
      desc: '',
      args: [],
    );
  }

  /// `Get The Last Offer`
  String get get_the_last_offer {
    return Intl.message(
      'Get The Last Offer',
      name: 'get_the_last_offer',
      desc: '',
      args: [],
    );
  }

  /// `Easy To Buy Any Thing`
  String get easy_to_buy_any_thing {
    return Intl.message(
      'Easy To Buy Any Thing',
      name: 'easy_to_buy_any_thing',
      desc: '',
      args: [],
    );
  }

  /// `password is not the match`
  String get password_is_not_the_match {
    return Intl.message(
      'password is not the match',
      name: 'password_is_not_the_match',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Loading..`
  String get loading {
    return Intl.message(
      'Loading..',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `you are not add products yet pleas click on plus and add new products to show here`
  String
      get you_arent_add_products_yet_pleas_click_on_plus_and_add_new_products_to_show_here {
    return Intl.message(
      'you are not add products yet pleas click on plus and add new products to show here',
      name:
          'you_arent_add_products_yet_pleas_click_on_plus_and_add_new_products_to_show_here',
      desc: '',
      args: [],
    );
  }

  /// `product you added recently `
  String get product_you_added_recently {
    return Intl.message(
      'product you added recently ',
      name: 'product_you_added_recently',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get add_product {
    return Intl.message(
      'Add Product',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name Product`
  String get enter_name_product {
    return Intl.message(
      'Enter Name Product',
      name: 'enter_name_product',
      desc: '',
      args: [],
    );
  }

  /// `add Color and image to `
  String get add_color_and_image_to {
    return Intl.message(
      'add Color and image to ',
      name: 'add_color_and_image_to',
      desc: '',
      args: [],
    );
  }

  /// `Enter Color`
  String get enter_color {
    return Intl.message(
      'Enter Color',
      name: 'enter_color',
      desc: '',
      args: [],
    );
  }

  /// `Enter price`
  String get enter_price {
    return Intl.message(
      'Enter price',
      name: 'enter_price',
      desc: '',
      args: [],
    );
  }

  /// `enter number only`
  String get enter_number_only {
    return Intl.message(
      'enter number only',
      name: 'enter_number_only',
      desc: '',
      args: [],
    );
  }

  /// `Add Color with Price`
  String get add_color_with_price {
    return Intl.message(
      'Add Color with Price',
      name: 'add_color_with_price',
      desc: '',
      args: [],
    );
  }

  /// `Pick Image From Gallery Or Camera `
  String get pick_image_from_gallery_or_camera {
    return Intl.message(
      'Pick Image From Gallery Or Camera ',
      name: 'pick_image_from_gallery_or_camera',
      desc: '',
      args: [],
    );
  }

  /// `select Color To Add Images `
  String get select_color_to_add_images {
    return Intl.message(
      'select Color To Add Images ',
      name: 'select_color_to_add_images',
      desc: '',
      args: [],
    );
  }

  /// `can't add Product`
  String get can_not_add_product {
    return Intl.message(
      'can\'t add Product',
      name: 'can_not_add_product',
      desc: '',
      args: [],
    );
  }

  /// `no Images added yet`
  String get no_images_added_yet {
    return Intl.message(
      'no Images added yet',
      name: 'no_images_added_yet',
      desc: '',
      args: [],
    );
  }

  /// `Enter Size`
  String get enter_size {
    return Intl.message(
      'Enter Size',
      name: 'enter_size',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
