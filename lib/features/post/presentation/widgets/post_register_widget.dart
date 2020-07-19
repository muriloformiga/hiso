import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/imput_decorated_widget.dart';
import 'package:hiso/features/post/presentation/bloc/post_bloc.dart';

class PostRegisterWidget extends StatelessWidget {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final hospitalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ImputDecoratedWidget(
          controller: nameController,
          placeholder: 'Nome',
        ),
        ImputDecoratedWidget(
          controller: lastNameController,
          placeholder: 'Sobrenome',
        ),
        ImputDecoratedWidget(
          controller: hospitalController,
          placeholder: 'Unidade de Saúde',
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostPacientRegisterLoading) {
              return CircularProgressIndicator();
            }
            return CupertinoButton.filled(
              child: Text('Continuar'),
              onPressed: () => BlocProvider.of<PostBloc>(context).add(
                PostPacientRegisterStarted(
                  name: nameController.text,
                  lastName: lastNameController.text,
                  hospital: hospitalController.text,
                  healthNumber: '1234567894',
                  birthDate: DateTime.now(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
