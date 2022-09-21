import 'dart:io';

import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common/const/const/form_group_key.dart';
import '../../../../common/widget/motion_toast.dart';
import '../../domain/entities/add_product_attributes.dart';
import '../../domain/entities/color_and_image.dart';

class AddProductProvider extends ChangeNotifier {
  AddProductProvider() {
    listen();
  }

  final ImagePicker picker = ImagePicker();
  List<AddProductAttributes> addProductAttributes = [];

  int get indexCurrentSizeSelected =>
      addProductAttributes.indexWhere((element) => element.isSelected);

  int get indexCurrentColorSelected =>
      (addProductAttributes[indexCurrentSizeSelected].colorAndImage ?? [])
          .indexWhere((element) => element.isSelected);
  final List<bool> _enterCustomDate = [false, false]; //todo refactor to one

  List<bool> get enterCustomDate => _enterCustomDate;

  enterCustomDateWithIndex(bool value, int index) {
    _enterCustomDate[index] = value;
    notifyListeners();
  }

  selectSize(int index) {
    int i = addProductAttributes.indexWhere((element) => element.isSelected);
    if (i < 0) {
      return;
    }
    addProductAttributes[i] = addProductAttributes[i].copyWithIsSelected();
    addProductAttributes[index] =
        addProductAttributes[index].copyWithIsSelected();
    notifyListeners();
  }

  reset() {
    addProductAttributes = [];
    form.reset();
    notifyListeners();
  }

  selectColor(int index) {
    int i = (addProductAttributes[indexCurrentSizeSelected].colorAndImage ?? [])
        .indexWhere((element) => element.isSelected);
    if (i < 0) {
      return;
    }
    addProductAttributes[indexCurrentSizeSelected].colorAndImage?[i] =
        addProductAttributes[indexCurrentSizeSelected]
            .colorAndImage?[i]
            .copyWithIsSelected();
    addProductAttributes[indexCurrentSizeSelected].colorAndImage?[index] =
        addProductAttributes[indexCurrentSizeSelected]
            .colorAndImage?[index]
            .copyWithIsSelected();
    notifyListeners();
  }

  final form = FormGroup(
    {
      FormGroupKey.name:
          FormControl<String?>(validators: [Validators.required]),
      FormGroupKey.size: FormControl<String?>(),
      FormGroupKey.color: FormControl(validators: [
        Validators.required,
      ]),
      FormGroupKey.price:
          FormControl(validators: [Validators.required, Validators.number]),
      FormGroupKey.urlColor: FormControl(validators: [
        Validators.pattern(RegExp(
            r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
            caseSensitive: false))
      ]),
    },
  );

  addColorWithPrice(context) {
    form.control(FormGroupKey.urlColor).markAsDisabled();
    if (form.valid) {
      if (addProductAttributes[indexCurrentSizeSelected]
              .colorAndImage
              ?.firstWhereOrNull((element) =>
                  element.color ==
                  form.control(FormGroupKey.color).value as String) !=
          null) {
        showToast(
            context: context,
            text: 'color added recently',
            contentType: ContentType.warning);
        form.control(FormGroupKey.urlColor).markAsEnabled();

        return;
      }
      final int indexSelected =
          (addProductAttributes[indexCurrentSizeSelected].colorAndImage ?? [])
              .indexWhere((element) => element.isSelected);
      if (indexSelected >= 0) {
        addProductAttributes[indexCurrentSizeSelected]
                .colorAndImage?[indexSelected] =
            addProductAttributes[indexCurrentSizeSelected]
                .colorAndImage?[indexSelected]
                .copyWithIsSelected();
      }
      var index = indexCurrentSizeSelected;
      addProductAttributes[index] = addProductAttributes[index].copyWith(
          colorAndImage: (addProductAttributes[index].colorAndImage ?? [])
            ..add(ColorAndImage(
                color: form.control(FormGroupKey.color).value as String,
                images: const [],
                price: int.parse(form.control(FormGroupKey.price).value),
                isSelected: true)));

      form.control(FormGroupKey.color).reset();
      form.control(FormGroupKey.price).reset();
      form.unfocus(touched: false);
    } else {
      form.markAllAsTouched();
    }
    form.control(FormGroupKey.urlColor).markAsEnabled();
  }

  bool checkValidAddProduct(BuildContext context) {
    final int lengthColor = getAllColorsSelected(addProductAttributes).length;
    var indexWhere = addProductAttributes.indexWhere(
        (element) => (element.colorAndImage?.length ?? 0) < lengthColor);
    if (indexWhere >= 0) {
      showToast(
          context: context,
          text: "mising Varientis",
          contentType: ContentType.warning,
          description:
              "you should Add Color With Price  to this Size : ${addProductAttributes[indexWhere].size}");
      return false;
    }
    if (form.control(FormGroupKey.name).value == null &&
        (form.control(FormGroupKey.name).value as String?)?.trim() == '') {
      form.control(FormGroupKey.name).focus();
      return false;
    }
    for (int i = 0; i < addProductAttributes.length; i++) {
      for (int j = 0;
          j < (addProductAttributes[i].colorAndImage?.length ?? 0);
          j++) {
        if (addProductAttributes[i].colorAndImage?[j].images.isEmpty ?? true) {
          showToast(
              context: context,
              text: "mising information",
              contentType: ContentType.warning,
              description:
                  "you should Add urls to Color ${addProductAttributes[i].colorAndImage![j].color}");
          return false;
        }
      }
    }
    return true;
  }

  static List<String> getAllColorsSelected(
      List<AddProductAttributes> addProductAttributes) {
    final List<String> color = [];

    for (AddProductAttributes e in addProductAttributes) {
      for (ColorAndImage i in (e.colorAndImage ?? [])) {
        color.add(i.color);
      }
    }
    return color.toSet().toList();
  }

  addImageToColor(XFile? image) {
    if (image == null) {
      return;
    }

    var indexSize = indexCurrentSizeSelected;
    var indexColor = indexCurrentColorSelected;
    addProductAttributes[indexSize].colorAndImage?[indexColor] =
        addProductAttributes[indexSize]
            .colorAndImage?[indexColor]
            .copyWith(image: File(image.path));

    notifyListeners();
  }

  void listen() {
    form.control(FormGroupKey.color).statusChanged.listen((event) {
      notifyListeners();
    });
  }
}
