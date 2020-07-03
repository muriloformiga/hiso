import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/presentation/pages/information_page.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Image(
                image: AssetImage(
                  AppImages.logo,
                ),
              ),
            ),
            CustomTextWidget(
              text: 'Crie sua conta gratuitamente',
              fontSize: 32.0,
              paddingValue: 20.0,
            ),
            CustomTextWidget(
              text: 'Entre e comece a fazer a diferença',
              fontSize: 20.0,
              paddingValue: 20.0,
            ),
            CustomTextWidget(
              text: 'Forneça informações sobre pacientes '
                  'internados para tranquilizar os '
                  'familiares e amigos.',
              fontSize: 16.0,
              paddingValue: 40.0,
            ),
            Container(
              width: 300.0,
              height: 48.0,
              child: CupertinoButton.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationPage(),
                    ),
                  );
                },
                child: Text('Entidade de Saude'),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 300.0,
              height: 48.0,
              child: CupertinoButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationPage(),
                    ),
                  );
                },
                child: Text('Familiar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
