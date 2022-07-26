import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/forget/forget_store.dart';
import 'package:veacos/app/shared/components/button_widget.dart';
import 'package:veacos/app/shared/components/link_rote_widget.dart';
import 'package:veacos/app/shared/components/text_field_widget.dart';
import 'package:veacos/app/shared/utils/snackbar_custom.dart';

class ForgetPage extends StatefulWidget {
  final String title;
  const ForgetPage({Key? key, this.title = 'ForgetPage'}) : super(key: key);
  @override
  ForgetPageState createState() => ForgetPageState();
}

class ForgetPageState extends State<ForgetPage> {
  final ForgetStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldForget = GlobalKey<ScaffoldState>();

  submit() async {
    await store.submit();
    if (store.client.msgForget$.value != '') {
      SnackbarCustom().createSnackBareErrOrGoal(scaffoldForget,
          message: store.client.msgForget$.value,
          errOrGoal: store.client.msgErrOrGoalForget$.value);
      if (store.client.msgErrOrGoalForget$.value) {
        Future.delayed(
          const Duration(seconds: 2),
          () => store.client.cleanVariables(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldForget,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "RECUPERAR SENHA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                ValueListenableBuilder(
                    valueListenable: store.client.email$,
                    builder: (context, value, child) {
                      return SizedBox(
                          child: TextFieldWidget(
                              labelText: 'E-mail',
                              onChanged: store.client.setEmail,
                              errorText: store.client.validateEmail));
                    }),
                SizedBox(height: size.height * 0.05),
                ValueListenableBuilder(
                    valueListenable: store.client.email$,
                    builder: (context, value, child) {
                      return Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: ButtonWidget(
                            label: 'ENVIAR SENHA',
                            theme: store.client.theme$.value,
                            width: size.width * 0.5,
                            loading: store.client.loading$.value,
                            function:
                                store.client.isValidEmail ? submit : null),
                      );
                    }),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 58),
                  child: const LinkRoteWidget(
                      labelBold: 'Voltar para o login', rota: '/auth/'),
                ),
              ],
            ),
          ));
        }),
      ),
    );
  }
}
