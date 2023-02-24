import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/publication_cubit.dart';
import 'buttom_widget.dart';
import 'custom_inputs.dart';

class ModalAddPublication extends StatefulWidget {
  const ModalAddPublication({super.key});

  @override
  State<ModalAddPublication> createState() => _ModalAddPublicationState();
}

class _ModalAddPublicationState extends State<ModalAddPublication> {
  String _tituloText = '';
  String _descriptionText = '';

  final ctrltitulo = TextEditingController();
  final ctrlDescription = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void onSave() async {
    if (_formKey.currentState!.validate()) {
      context
          .read<PublicationCubit>()
          .savePublication(_tituloText, _descriptionText);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 30,
            right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Agregar publicacion ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        autofocus: true,
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textAlignVertical: TextAlignVertical.center,
                        decoration:
                            CustomInput.decoration(labeltext: '*Titulo'),
                        validator: (value) => value!.length >= 2 ? null : '',
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            _tituloText = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        autofocus: true,
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textAlignVertical: TextAlignVertical.center,
                        validator: (value) => value!.length >= 2 ? null : '',
                        decoration:
                            CustomInput.decoration(labeltext: '*Descripcion'),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            _descriptionText = value;
                          }
                        },
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomButtomWidget(
                    borderRadius: 25,
                    color: Colors.redAccent,
                    onpress: () {
                      Navigator.pop(context);
                    },
                    isBorderSide: false,
                    text: 'Cancelar',
                    isloading: false,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomButtomWidget(
                    borderRadius: 25,
                    color: Colors.greenAccent,
                    onpress: () => onSave(),
                    isBorderSide: false,
                    text: 'Guardar',
                    isloading: false,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
          ],
        ));
  }
}
