import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_app/models/publication_model.dart';
part 'publication_state.dart';

class PublicationCubit extends Cubit<PublicationState> {
  PublicationCubit() : super(PublicationInitial());
  List<Publication> listPublications = [];
  Future<void> init() async {
    emit(PublicationLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      final String response = await rootBundle.loadString('assets/api.json');
      final data = await json.decode(response);
      final decodeData = PublicationModel.fromJson(data);
      listPublications = decodeData.publications;

      emit(PublicationSuccess(listPublications));
    } on Exception catch (e) {
      debugPrint('failed to read data');
    }
  }

  Future<void> savePublication(String title, String description) async {
    emit(PublicationLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      var idGenerate = Random();
      final newData = Publication(
          description: description,
          title: title,
          id: idGenerate.nextInt(100),
          isFavorite: false);
      listPublications.add(newData);

      emit(PublicationSuccess(listPublications));
    } on Exception catch (e) {
      debugPrint('failed to read data');
    }
  }

  Future<void> isFavorite(int idPublication) async {
    emit(PublicationLoading());

    try {
      listPublications = listPublications.map((item) {
        if (item.id != idPublication) return item;
        item.isFavorite = !item.isFavorite;
        return item;
      }).toList();

      emit(PublicationSuccess(listPublications));
    } on Exception catch (e) {
      debugPrint('failed to read data');
    }
  }
}
