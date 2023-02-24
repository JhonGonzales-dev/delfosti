import 'package:flutter/material.dart';
import 'package:technical_test_app/models/publication_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.publication});
  final Publication? publication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'title: ${publication!.title.toUpperCase()}',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Description : ${publication!.description}',
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
