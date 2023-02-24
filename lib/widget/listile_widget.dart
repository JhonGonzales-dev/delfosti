import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/publication_cubit.dart';
import '../models/publication_model.dart';
import '../pages/detail_page.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.data});
  final Publication data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: ListTile(
              dense: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        publication: data,
                      ),
                    ));
              },
              title: Text(
                data.title,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                onPressed: () {
                  context.read<PublicationCubit>().isFavorite(data.id);
                },
                icon: Icon(
                  Icons.favorite,
                  color: data.isFavorite ? Colors.red : Colors.white,
                  size: 20,
                ),
              )),
        ));
  }
}
