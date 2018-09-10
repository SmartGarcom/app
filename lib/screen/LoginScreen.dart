import 'package:flutter/material.dart';
import 'package:smart_garcom/component/Buttons/roundedButton.dart';
import 'package:smart_garcom/component/TextFields/ensure_visible_when_focused.dart';
import 'package:smart_garcom/component/loading.dart';
import 'package:smart_garcom/theme/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  static String tag = 'login-screen';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

enum Steps { INICIO, LOADING, LOGIN }

Steps step;

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FocusNode _focusNodeEmail = new FocusNode();
  static final TextEditingController _emailController =
      new TextEditingController();
  FocusNode _focusNodePassword = new FocusNode();
  static final TextEditingController _passwordController =
      new TextEditingController();

  ThemeData theme =
      getTheme(brightness: Brightness.dark, primaryColor: Colors.teal);

  @override
  void initState() {
    super.initState();
    step = Steps.INICIO;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: new Scaffold(
        backgroundColor: theme.primaryColor,
        body: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /* -- Something large -- */
                Container(
                  width: double.infinity,
                  height: 150.0,
//                  color: Colors.red,
                ),
                new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Icon(
                    Icons.fastfood,
                    color: logoColor,
                    size: 100.0,
                  ),
                ),
//                logo,
                new SizedBox(height: 32.0),

                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeEmail,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      labelText: 'Email',
                    ),
                    onSaved: (String value) {
                      //TODO
                    },
                    controller: _emailController,
                    focusNode: _focusNodeEmail,
                  ),
                ),
                new SizedBox(height: 32.0),

                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodePassword,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      labelText: 'Senha',
                    ),
                    onSaved: (String value) {
                      //TODO
                    },
                    controller: _passwordController,
                    focusNode: _focusNodePassword,
                  ),
                ),
                new SizedBox(height: 32.0),

                step == Steps.LOADING
                    ? new Loading()
                    : new RoundedButton(
                        buttonName: 'Fazer login',
                        borderWidth: 0.0,
                        buttonColor: colorInDark,
                        textColor: colorInLight,
                        onTap: () {},
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
