import 'package:flutter/material.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  AuthMode _authMode = AuthMode.login;
  Map<String, String> _authData = {'email': '', 'password': ''};

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    if (_isLogin()) {
    } else {
      // Sign user up
    }

    setState(() => _isLoading = false);
  }

  bool _isLogin() {
    return _authMode == AuthMode.login;
  }

  bool _isSignup() {
    return _authMode == AuthMode.signup;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width * 0.85;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: EdgeInsets.all(16),
        width: deviceSize,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail válido!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onSaved: (password) => _authData['password'] = password ?? '',
                controller: _passwordController,
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {
                    return 'Password is too short!';
                  }
                  return null;
                },
              ),
              if (_isSignup())
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: _isLogin()
                      ? null
                      : (_password) {
                          final password = _password ?? '';
                          if (password != _passwordController.text) {
                            return 'Senhas informadas não conferem!';
                          }
                          return null;
                        },
                ),
              SizedBox(height: 12),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 8.0,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    _authMode == AuthMode.login ? 'Login' : 'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              TextButton(
                onPressed: _switchAuthMode,
                child: Text(
                  _isLogin() ? 'Criar uma nova conta?' : 'Já possui conta?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
