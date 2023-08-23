part of 'product_bloc.dart';

class ProductState {
  final DataStateStatus status;
  final List<ProductModel>? products;
  final String errorMessage;

  ProductState({
    this.status = DataStateStatus.initial,
    this.products,
    this.errorMessage = "",
  });

  ProductState copyWith({
    DataStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
