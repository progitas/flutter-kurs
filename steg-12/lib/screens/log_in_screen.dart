import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/constants/text_field_decoration.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';
import 'package:progit_activity_booker/widgets/common/show_error_dialog.dart';

enum AuthMode { Signup, Login }

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 94.0),
                      transform: Matrix4.rotationZ(-8 * pi / 180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal.shade900,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'Progit',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 50,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
    'name': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
            begin: const Offset(0, -1.5), end: const Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState == null) {
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final email = _authData['email'] ?? '';
      final password = _authData['password'] ?? '';
      final name = _authData['name'] ?? '';

      if (_authMode == AuthMode.Login) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        await API.user.createUser(email, password, name);
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } catch (error) {
      const errorMessage = 'Klarte ikke å autentisere deg.';
      showErrorDialog(context, error.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.Signup ? 500 : 290,
          minWidth: 200,
          maxWidth: 300,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: getFormFieldDecoration(context, 'E-post'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@progit.no')) {
                      return 'Ugyldig e-post';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value ?? '';
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: getFormFieldDecoration(context, 'Passord'),
                  obscureText: true,
                  onFieldSubmitted: (_) =>
                      _authMode == AuthMode.Login ? _submit() : null,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 5) {
                      return 'Passord er for kort';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value ?? '';
                  },
                ),
                AnimatedContainer(
                  padding: EdgeInsets.only(top: 10),
                  duration: const Duration(milliseconds: 300),
                  constraints: BoxConstraints(
                    minHeight: _authMode == AuthMode.Signup ? 90 : 0,
                    maxHeight: _authMode == AuthMode.Signup ? 150 : 0,
                  ),
                  curve: Curves.easeIn,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          TextFormField(
                            enabled: _authMode == AuthMode.Signup,
                            decoration: getFormFieldDecoration(
                                context, 'Gjenta passord'),
                            obscureText: true,
                            validator: _authMode == AuthMode.Signup
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passordene er ikke like';
                                    }
                                  }
                                : null,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: _authMode == AuthMode.Signup,
                            decoration:
                                getFormFieldDecoration(context, 'Fullt Navn'),
                            keyboardType: TextInputType.name,
                            onFieldSubmitted: (_) => _submit(),
                            onSaved: (value) {
                              _authData['name'] = value ?? '';
                            },
                            validator: _authMode == AuthMode.Signup
                                ? (value) {
                                    if (value == null || !value.contains(' ')) {
                                      return 'Skriv inn fullt navn';
                                    }
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ChipButton(
                  loading: _isLoading,
                  label:
                      _authMode == AuthMode.Login ? 'Logg inn' : 'Lag bruker',
                  onClick: _submit,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  child: ChipButton(
                    label:
                        _authMode == AuthMode.Login ? 'Lag bruker' : 'Logg inn',
                    onClick: _switchAuthMode,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
