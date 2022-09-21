import '../../app/product/application/facade.dart';
import '../../app/product/domain/entities/Product.dart';
import '../../app/product/domain/repo/repo.dart';
import '../../app/product/infrastructrue/data_source/remote/remote.dart';
import '../../app/product/infrastructrue/repo/repo_impl.dart';
import '../../app/product/presentation/state/add_product_provider.dart';
import '../../app/product/presentation/state/bloc/product/product_bloc.dart';
import '../../app/product/presentation/state/select_piece_provider.dart';
import '../service_locator.dart';

Future<void> products() async {
  si.registerLazySingleton(() => ProductRemote(si()));
  si.registerLazySingleton<IProductRepo>(() => ProductRepoImpl(remote: si()));
  si.registerLazySingleton<ProductFacade>(
      () => ProductFacade(repo: si(), userApi: si()));
  si.registerSingleton<ProductBloc>(ProductBloc(facade: si()));
  si.registerFactoryParam(
      (Product param1, param2) => SelectPieceProvider(product: param1));
  si.registerSingleton(AddProductProvider());
}
