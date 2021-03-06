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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  message() {
    if (store.msg$.value != '') {
      SnackbarCustom().createSnackBareErrOrGoal(_scaffoldKey,
          message: store.msg$.value, errOrGoal: store.msgErrOrGoal$.value);
    }
    store.setMsg('');
  }

  submit() async {
    await store.submit();
    message();
  }

  submitGoogle() async {
    await store.loginWithGoogle();
    message();
  }

  submitBiometric() async {
    await store.authenticateBiometric();
    message();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => store.client.cleanVariables());
  }

  @override
  void initState() {
    store.loading$.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: _scaffoldKey,
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
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
                            function: submit,
                            errorText: store.client.validatePassword),
                      );
                    }),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: const LinkRoteWidget(
                      labelBold: 'Esqueceu a senha ? ', rota: '/auth/forget/'),
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
                            loading: store.loading$.value,
                            function:
                                store.client.isValidLogin ? submit : null),
                      );
                    }),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 58),
                  child: const LinkRoteWidget(
                      labelBold: 'N??o tem cadastro? Registre-se',
                      rota: '/auth/signup/'),
                ),
                ValueListenableBuilder(
                    valueListenable: store.supportState$,
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
                                    image: AssetImage('assets/img/google.png'),
                                  ),
                                  onTap: submitGoogle,
                                ),
                              ),
                            ),
                            store.supportState$.value == SupportState.supported
                                ? GestureDetector(
                                    onTap: submitBiometric,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      width: 64,
                                      child: ValueListenableBuilder(
                                          valueListenable: store.faceOrFinger$,
                                          builder: (context, value, child) {
                                            return store.faceOrFinger$.value
                                                ? const Image(
                                                    image: AssetImage(
                                                        'assets/img/face.png'))
                                                : const Image(
                                                    image: AssetImage(
                                                        'assets/img/digital.png'));
                                          }),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
