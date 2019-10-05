import 'package:flutter/material.dart';
import 'package:forth_shop_app/providers/login_provider.dart';
import '../painter/login_background.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  AuthMode _authMode = AuthMode.Login;
  var _isLoading = false;

  Map<String, String> _authData = {'email': '', 'password': ''};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _inputIdTextEditController = TextEditingController();

  final _inputPwdTextEditController = TextEditingController();

  final _passwordFocus = FocusNode();

  final _passwordConfirmFocus = FocusNode();

  Future<void> submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_authMode == AuthMode.Login) {
// Log user in
    } else {
// Sign user up
      await Provider.of<LoginProvider>(context, listen: false).signUp(
        _authData['email'],
        _authData['password'],
        context,
      );
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
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  Widget _authButton(Size sized, BuildContext context) => Positioned(
        left: sized.width * 0.15,
        right: sized.width * 0.15,
        bottom: 0,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: _authMode == AuthMode.Login
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).errorColor,
                onPressed: () {
                  _authMode == AuthMode.Login
                      ? print('Here is Login page')
                      : submit();
                },
                textColor: Theme.of(context).primaryTextTheme.title.color,
                child: Text(
                  _authMode == AuthMode.Login ? 'Login' : 'Join',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      );

  Widget _userInputCard(Size sized, BuildContext context) => Padding(
        padding: EdgeInsets.all(sized.width * 0.05),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: Padding(
            padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 50),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _inputIdTextEditController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please Enter correct Email';
                      }
                      return null;
                    },
                    onSaved: (inputValue) {
                      _authData['email'] = inputValue;
                      print(_authData['email']);
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocus),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _inputPwdTextEditController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Please Enter correct Password';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context)
                        .requestFocus(_passwordConfirmFocus),
                    onSaved: (inputValue) {
                      _authData['password'] = inputValue;
                      print(_authData['password']);
                    },
                    focusNode: _passwordFocus,
                  ),
                  Opacity(
                    opacity: _authMode == AuthMode.Login ? 0.0 : 1.0,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirm password',
                          icon: Icon(Icons.vpn_key)),
                      validator: (inputVale) {
                        if (inputVale != _inputPwdTextEditController.text) {
                          return 'Checking Your Confirm Password!';
                        }
                        return null;
                      },
                      focusNode: _passwordConfirmFocus,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Opacity(
                      opacity: _authMode == AuthMode.Login ? 1.0 : 0.0,
                      child: Text('Forgot Passowrd?')),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: sized,
            painter: LoginBackground(isLogin: _authMode),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: sized.height * 0.05,
                    left: sized.width * 0.1,
                    right: sized.width * 0.1,
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/loading/animaions.gif'),
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  _userInputCard(sized, context),
                  _authButton(sized, context),
                ],
              ),
              SizedBox(
                height: sized.height * 0.1,
              ),
              Consumer<LoginProvider>(
                builder: (context, joinOrLogin, child) => GestureDetector(
                  onTap: _switchAuthMode,
                  child: Text(
                    _authMode == AuthMode.Login
                        ? 'Already have account? Sign In'
                        : 'Don\'t have an Account? Create One',
                    style: TextStyle(
                      fontSize: 18,
                      color: _authMode == AuthMode.Login
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).errorColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sized.height * 0.05,
              )
            ],
          )
        ],
      ),
    );
  }
}
