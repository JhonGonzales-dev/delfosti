import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_app/cubit/publication_cubit.dart';

import '../widget/listile_widget.dart';
import '../widget/modal_publication.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Publication App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => modalAddPublication(context),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<PublicationCubit, PublicationState>(
          builder: (context, state) {
            if (state is PublicationSuccess) {
              final data = state.listPublications;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTileWidget(data: data[index]);
                  });
            } else if (state is PublicationLoading) {
              return const Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()));
            }
            return Container();
          },
        ));
  }

  void modalAddPublication(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (_) => const ModalAddPublication());
  }
}
