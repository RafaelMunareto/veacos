import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/login/login_store.dart';
import 'package:veacos/app/shared/components/button_widget.dart';
import 'package:veacos/app/shared/components/link_rote_widget.dart';
import 'package:veacos/app/shared/components/text_field_widget.dart';
import 'package:veacos/app/shared/utils/snackbar_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldLogin = GlobalKey<ScaffoldState>();

  submit() async {
    await store.submit();
    if (store.client.msg$.value != '') {
      SnackbarCustom().createSnackBareErrOrGoal(scaffoldLogin,
          message: store.client.msg$.value,
          errOrGoal: store.client.msgErrOrGoal$.value);
      if (store.client.msgErrOrGoal$.value) {
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldLogin,
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
                      "LOGIN",
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
                  ValueListenableBuilder(
                      valueListenable: store.client.password$,
                      builder: (context, value, child) {
                        return SizedBox(
                          child: TextFieldWidget(
                              labelText: 'Senha',
                              obscure: true,
                              onChanged: store.client.setPassword,
                              functionBool: store.client.isValidLogin,
                              function: store.submit,
                              errorText: store.client.validatePassword),
                        );
                      }),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: const LinkRoteWidget(
                        labelBold: 'Esqueceu a senha ? ',
                        rota: '/auth/forget/'),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ValueListenableBuilder(
                      valueListenable: store.client.password$,
                      builder: (context, value, child) {
                        return Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: ButtonWidget(
                              label: 'LOGIN',
                              theme: store.client.theme$.value,
                              width: size.width * 0.5,
                              loading: store.client.loading$.value,
                              function:
                                  store.client.isValidLogin ? submit : null),
                        );
                      }),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 58),
                    child: const LinkRoteWidget(
                        labelBold: 'Não tem cadastro? Registre-se',
                        rota: '/auth/signup/'),
                  ),
                  ValueListenableBuilder(
                      valueListenable: store.client.supportState$,
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 32, right: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: const Image(
                                      image:
                                          AssetImage('assets/img/google.png'),
                                    ),
                                    onTap: store.loginWithGoogle,
                                  ),
                                ),
                              ),
                              store.client.supportState$.value ==
                                      SupportState.supported
                                  ? GestureDetector(
                                      onTap: store.authenticateBiometric,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: 64,
                                        child: store.client.faceOrFinger$.value
                                            ? const Image(
                                                image: AssetImage(
                                                    'assets/img/face.png'))
                                            : const Image(
                                                image: AssetImage(
                                                    'assets/img/digital.png')),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
