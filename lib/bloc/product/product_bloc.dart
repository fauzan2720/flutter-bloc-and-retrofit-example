import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:starter_app/repository/escuelajs_api_service.dart';
import 'package:starter_app/repository/models/product_model.dart';
import 'package:starter_app/state.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final EscuelajsApiService escuelajsApiService;
  ProductBloc(
    this.escuelajsApiService,
  ) : super(ProductState()) {
    on<GetProductEvent>((event, emit) async {
      emit(state.copyWith(
        status: DataStateStatus.loading,
      ));

      try {
        final List<ProductModel> products =
            await escuelajsApiService.getProducts();
        emit(state.copyWith(
          status: DataStateStatus.success,
          products: products,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: DataStateStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
