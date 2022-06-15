import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autorun(
      (_) {
        if (store.client.msg != '') {
          FocusScope.of(context).requestFocus(FocusNode());
          SnackbarCustom().createSnackBareErrOrGoal(_scaffoldKey,
              message: store.client.msg,
              errOrGoal: store.client.msgErrOrGoal,
              rota: '/auth/');
          if (store.client.msgErrOrGoal) {
            Timer(const Duration(seconds: 2),
                () => store.client.cleanVariables());
          }
          store.client.setMsg('');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: LayoutBuilder(builder: (context, constraint) {
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
              SizedBox(
                  child: TextFieldWidget(
                      labelText: 'E-mail',
                      onChanged: store.client.setEmail,
                      errorText: store.client.validateEmail)),
              SizedBox(height: size.height * 0.05),
              Observer(builder: (_) {
                return Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ButtonWidget(
                      label: 'ENVIAR SENHA',
                      theme: store.client.theme,
                      width: size.width * 0.5,
                      loading: store.client.isValidLogin,
                      function:
                          store.client.isValidEmail ? store.submit : null),
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
    );
  }
}
