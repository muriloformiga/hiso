import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/features/post/presentation/widgets/post_register_widget.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de paciente'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: PostRegisterWidget(),
      ),
    );
  }
}
