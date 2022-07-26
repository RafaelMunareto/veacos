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
    store.client.setCode(widget.code);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (store.client.msg$.value != '') {
      FocusScope.of(context).requestFocus(FocusNode());
      SnackbarCustom().createSnackBareErrOrGoal(_scaffoldKey,
          message: store.client.msg$,
          errOrGoal: store.client.msgErrOrGoal$,
          rota: '/auth/');
      store.client.setMsg('');
      if (store.client.msgErrOrGoal$.value) {
        Timer(const Duration(seconds: 2), () => store.client.cleanVariables());
      }
    }
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
            SizedBox(
              child: TextFieldWidget(
                  labelText: 'Senha',
                  obscure: true,
                  onChanged: store.client.setPassword,
                  functionBool: false,
                  errorText: store.client.validatePassword),
            ),
            ValueListenableBuilder(
                valueListenable: store.client.password$,
                builder: (context, value, child) {
                  return SizedBox(
                    child: TextFieldWidget(
                        labelText: 'Confirmação de senha',
                        obscure: true,
                        onChanged: store.client.setConfirmPassword,
                        functionBool: store.client.isValidChangePassword,
                        function: store.submit,
                        errorText: store.client.validateConfirmPassword),
                  );
                }),
            SizedBox(height: size.height * 0.05),
            ValueListenableBuilder(
                valueListenable: store.client.password$,
                builder: (context, value, child) {
                  return Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ButtonWidget(
                      label: 'ALTERAR',
                      theme: store.client.theme$.value,
                      width: size.width * 0.5,
                      loading: store.client.loading$.value,
                      function: store.client.isValidChangePassword
                          ? store.submit
                          : null,
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
