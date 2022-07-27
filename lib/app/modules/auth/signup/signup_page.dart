import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/signup/signup_store.dart';
import 'package:veacos/app/shared/components/button_widget.dart';
import 'package:veacos/app/shared/components/link_rote_widget.dart';
import 'package:veacos/app/shared/components/text_field_widget.dart';
import 'package:veacos/app/shared/utils/snackbar_custom.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final SignupStore store = Modular.get();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  submit() async {
    await store.submit();
    if (store.msg$.value != '') {
      SnackbarCustom().createSnackBareErrOrGoal(_scaffoldKey,
          message: store.msg$.value, errOrGoal: store.msgErrOrGoal$.value);
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
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "CADASTRO",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              ValueListenableBuilder(
                  valueListenable: store.client.name$,
                  builder: (context, value, child) {
                    return SizedBox(
                        child: TextFieldWidget(
                            labelText: 'Nome',
                            onChanged: store.client.setName,
                            errorText: store.client.validateName));
                  }),
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
                          functionBool: store.client.isValidSignup,
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
                          label: 'CADASTRAR',
                          theme: store.client.theme$.value,
                          width: size.width * 0.5,
                          loading: store.loading$.value,
                          function: store.client.isValidSignup ? submit : null),
                    );
                  }),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 58),
                child: const LinkRoteWidget(
                    labelBold: 'Já possui cadastro? Login', rota: '/auth/'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
