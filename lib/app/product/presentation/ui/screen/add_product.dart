import 'package:aroundix_design/design.dart';
import 'package:aroundix_store/app/product/domain/entities/param/param_add_to_product.dart';
import 'package:aroundix_store/app/product/presentation/state/add_product_provider.dart';
import 'package:aroundix_store/app/user/presentation/widget/button_auth.dart';
import 'package:aroundix_store/common/widget/motion_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../common/const/const/form_group_key.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../injection/service_locator.dart';
import '../../state/bloc/product/product_bloc.dart';
import '../widget/add_size.dart';
import '../widget/enter_color_and_price.dart';
import '../widget/list_of_color_selected.dart';
import '../widget/show_color_and_url_selected.dart';
import '../widget/title_bottom_sheet.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static String path = 'add-product-screen';
  static String name = 'add-product-screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: si<AddProductProvider>()),
            BlocProvider.value(value: si<ProductBloc>())
          ],
          child: const AddProductScreen(),
        ),
      );

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Consumer<AddProductProvider>(builder: (context, state, _) {
      return Scaffold(
        appBar: AppBar(
          title:  Text(s.add_product),
          actions: [
           if(state.addProductAttributes.isNotEmpty) IconButton(
                onPressed: () {
                  state.reset();
                },
                icon: const Icon(Icons.remove_circle_outline)),
          ],
        ),
        body: BlocListener<ProductBloc, ProductState>(
          listener: _listener,
          child: ReactiveForm(
            formGroup: state.form,
            child: ListView(children: [
              RPadding(
                padding: PEdgeInsets.horizontal,
                child: CustomStyleReactiveTextFiled(
                  hintText: s.enter_name_product,
                  prefixIcon: Icons.pages,
                  formControlName: FormGroupKey.name,
                  validationMessages: {
                    ValidationMessage.required: (error) => s.required
                  },
                ),
              ),
              Space.vS3,
              const AddSizeWidget(),
              Space.vM3,
              if (state.addProductAttributes.isNotEmpty) //todo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EnterColorAndPriceWidget(),
                    const Divider(),
                    Space.vM4,
                    if (state
                            .addProductAttributes[
                                state.indexCurrentSizeSelected]
                            .colorAndImage
                            ?.isNotEmpty ??
                        false)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ListOfColorSelected(),
                          Space.vM4,
                           TitleText(
                            text: s.pick_image_from_gallery_or_camera,
                          ),
                          Space.vS3,
                          Center(
                            child: FractionallySizedBox(
                              widthFactor: .7,
                              child: Container(
                                padding: REdgeInsets.symmetric(
                                    vertical: LayoutConstrains.s2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius:
                                        PBorderRadius.borderRadiusAllM1),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtomChoseImage(
                                        onTap: () async {
                                          state.addImageToColor(
                                              await state.picker.pickImage(
                                                  source: ImageSource.camera));
                                        },
                                        iconData: Icons.camera_alt,
                                      ),
                                      VerticalDivider(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(.7)),
                                      ButtomChoseImage(
                                          onTap: () async {
                                            state.addImageToColor(
                                                await state.picker.pickImage(
                                                    source:
                                                        ImageSource.gallery));
                                          },
                                          iconData: Icons.image),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Space.vM1,
                          const ShowColorAndImagesSelected(),
                          Space.vM4,
                          BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, stateP) {
                              if (stateP.addProductStatus.isLoading()) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Center(
                                child: ButtonAuth(
                                    customText: s.add_product,
                                    onTap: () {
                                      if (state.checkValidAddProduct(context)) {
                                        context.read<ProductBloc>().add(
                                            AddProduct(
                                                paramAddProduct: ParamAddProduct(
                                                    productName: state.form
                                                        .control(
                                                            FormGroupKey.name)
                                                        .value as String,
                                                    addProductAttributes: state
                                                        .addProductAttributes)));
                                      }
                                    }),
                              );
                            },
                          ),
                          Space.vXL1
                        ],
                      ),
                  ],
                )
            ]),
          ),
        ),
      );
    });
  }

  void _listener(BuildContext context, ProductState state) {
    if (state.addProductStatus.isFail()) {
      showToast(
          context: context,
          text: S.of(context).can_not_add_product,
          description: state.addProductStatus.error ?? '',
          contentType: ContentType.failure);
    }
    if (state.addProductStatus.isSuccess()) {
      context.read<ProductBloc>()
        ..add(ResetAddProduct())
        ..add(GetAllProduct());
      context.read<AddProductProvider>().reset();

      // Navigator.of(context).pop();
    }
  }
}

class ButtomChoseImage extends StatelessWidget {
  const ButtomChoseImage(
      {Key? key, required this.iconData, required this.onTap})
      : super(key: key);
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Center(child: Icon(iconData)),
        ),
      ),
    );
  }
}
