import 'package:aroundix_network/p_http_client.dart';
import 'package:http_parser/http_parser.dart';
import '../add_product_attributes.dart';

class ParamAddProduct {
  final String productName;
  final List<AddProductAttributes> addProductAttributes;

  ParamAddProduct({
    required this.productName,
    required this.addProductAttributes,
  });

  Future<Map<String, dynamic>> toMap() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    int numberVariation = 0;

    for (int i = 0; i < addProductAttributes.length; i++) {
      data['productSizes[$i]'] = addProductAttributes[i].size;

      for (int j = 0; j < addProductAttributes[i].colorAndImage!.length; j++) {
        data['productColors[$j][colorName]'] =
            addProductAttributes[i].colorAndImage![j].color;

        data['productVariations[$numberVariation][variantPrice]'] =
            addProductAttributes[i].colorAndImage![j].price;
        data['productVariations[$numberVariation][variantAttributes][variantColor][colorName]'] =
            addProductAttributes[i].colorAndImage![j].color;
        data['productVariations[$numberVariation][variantAttributes][variantSize]'] =
            addProductAttributes[i].size;
        numberVariation++;
        for (int l = 0;
            l < addProductAttributes[i].colorAndImage![j].images.length;
            l++) {
          String fileName = addProductAttributes[i]
              .colorAndImage![j]
              .images[l]
              .path
              .split('/')
              .last;
          data['productColors[$j][colorImages][$l]'] =
              await MultipartFile.fromFile(
            addProductAttributes[i].colorAndImage![j].images[l].path,
            filename: fileName,
            contentType: MediaType("image", "jpeg"),
          );
        }
      }
    }

    return data;
  }

  const ParamAddProduct.empty()
      : productName = '',
        addProductAttributes = const [];
}
