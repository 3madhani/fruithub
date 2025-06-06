import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/repos/product_repo/product_repo.dart';

import '../../entities/product_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo productRepo;
  ProductsCubit({required this.productRepo}) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
