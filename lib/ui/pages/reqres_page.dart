import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/bloc/user/user_bloc.dart';
import 'package:starter_app/repository/models/user_model.dart';

class ReqresPage extends StatelessWidget {
  const ReqresPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<OldUserBloc>().add(GetUserEvent());
    context.read<UserBloc>().add(const UserEvent.getData());

    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          // if (state.status == DataStateStatus.loading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (state.status == DataStateStatus.error) {
          //   return Center(
          //     child: Text(state.errorMessage),
          //   );
          // } else if (state.status == DataStateStatus.success) {
          //   return ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       final UserModel data = state.users![index];

          //       return Card(
          //         child: ListTile(
          //           onTap: () {},
          //           leading: ClipRRect(
          //             borderRadius: BorderRadius.circular(50.0),
          //             child: Image.network(data.avatar),
          //           ),
          //           title: Text("${data.firstName} ${data.lastName}"),
          //           subtitle: Text(data.email),
          //         ),
          //       );
          //     },
          //   );
          // } else {
          //   return const SizedBox.shrink();
          // }

          // WITH FREEZED
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (users) => ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                final UserModel data = users[index];
                return Card(
                  child: ListTile(
                    onTap: () {},
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(data.avatar),
                    ),
                    title: Text("${data.firstName} ${data.lastName}"),
                    subtitle: Text(data.email),
                  ),
                );
              },
            ),
            error: (errorMessage) => Center(
              child: Text(errorMessage),
            ),
          );
        },
      ),
    );
  }
}
