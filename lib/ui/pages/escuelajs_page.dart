import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/bloc/product/product_bloc.dart';
import 'package:starter_app/repository/models/product_model.dart';
import 'package:starter_app/state.dart';

class EscuelajsPage extends StatelessWidget {
  const EscuelajsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductEvent());

    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == DataStateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == DataStateStatus.error) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state.status == DataStateStatus.success) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                final ProductModel data = state.products![index];

                return Card(
                  child: ListTile(
                    onTap: () {},
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(data.images[0]),
                    ),
                    title: Text(data.title),
                    subtitle: Text(data.description),
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
