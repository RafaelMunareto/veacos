import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/change/change_store.dart';
import 'package:veacos/app/shared/components/button_widget.dart';
import 'package:veacos/app/shared/components/link_rote_widget.dart';
import 'package:veacos/app/shared/components/text_field_widget.dart';
import 'package:veacos/app/shared/utils/snackbar_custom.dart';

class ChangePage extends StatefulWidget {
  final String title;
  final dynamic code;

  const ChangePage({Key? key, this.title = 'Trocar senha', this.code = ''})
      : super(key: key);

  @override
  ChangePageState createState() => ChangePageState();
}

class ChangePageState extends State<ChangePage> {
  final ChangeStore store = Modular.get();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    store.setCode(widget.code);
    store.loading$.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  submit() async {
    await store.submit();
    if (store.msg$.value != '') {
      SnackbarCustom().createSnackBareErrOrGoal(_scaffoldKey,
          message: store.msg$.value,
          errOrGoal: store.msgErrOrGoal$.value,
          rota: '/auth/');
    }
    store.setMsg('');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => store.client.cleanVariables());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "ALTERAÇÃO DE SENHA",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Theme.of(context).primaryColor),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ValueListenableBuilder(
                valueListenable: store.client.password$,
                builder: (context, value, child) {
                  return SizedBox(
                    child: TextFieldWidget(
                        labelText: 'Senha',
                        obscure: true,
                        onChanged: store.client.setPassword,
                        functionBool: false,
                        errorText: store.client.validatePassword),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: store.client.confirmPassword$,
                builder: (context, value, child) {
                  return SizedBox(
                    child: TextFieldWidget(
                        labelText: 'Confirmação de senha',
                        obscure: true,
                        onChanged: store.client.setConfirmPassword,
                        functionBool: store.client.isValidChangePassword,
                        function: submit,
                        errorText: store.client.validateConfirmPassword),
                  );
                }),
            SizedBox(height: size.height * 0.05),
            ValueListenableBuilder(
                valueListenable: store.client.confirmPassword$,
                builder: (context, value, child) {
                  return Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ButtonWidget(
                      label: 'ALTERAR',
                      theme: store.client.theme$.value,
                      width: size.width * 0.5,
                      loading: store.loading$.value,
                      function:
                          store.client.isValidChangePassword ? submit : null,
                    ),
                  );
                }),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 58),
              child: const LinkRoteWidget(labelBold: 'Login', rota: '/auth/'),
            ),
          ],
        ),
      )),
    );
  }
}
