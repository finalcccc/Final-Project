import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/bg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              _buildForm(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildForm() => Card(
        margin: EdgeInsets.only(
          top: 90,
          right: 30,
          left: 30,
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                _logo(),
                SizedBox(
                  height: 22,
                ),
                _buildUsernameInput(),
                SizedBox(
                  height: 8,
                ),
                _builPasswordInput(),
                SizedBox(
                  height: 28,
                ),
                _buildSubmitButton(),
                SizedBox(
                  height: 8,
                ),
                _buildSubmitForgotPasswordButton(),
              ],
            ),
          ),
        ),
      );

  Widget _logo() => Image.asset(
        ("assets/header_main.png"),
        fit: BoxFit.cover,
      );

  Widget _buildUsernameInput() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'amnong2021@gmail.com',
          icon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: _validateEmail,
        onSaved: (value) {},
        onFieldSubmitted: (String value) {},
      );

  Widget _builPasswordInput() => TextFormField(
        decoration: InputDecoration(
          labelText:'Password',
          icon: Icon(
            Icons.lock,
          ),
        ),
        obscureText: true,
        validator: _validatePassword,
        onSaved: (value) {},
        keyboardType: TextInputType.visiblePassword,
      );

  Widget _buildSubmitButton() => Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: Colors.blue,
          onPressed: _submit,
          child: Text(
            'Login'.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  Widget _buildSubmitForgotPasswordButton() => Container(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          splashColor: Colors.blue.shade500,
          onPressed: () {},
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      );
  void _submit() {
    if(this._formkey.currentState.validate()){
      //to do
    }
  }

  String? _validateEmail(value) {
    if(value.isEmty){
      return "The Email is emty";
    }
    if(!isEmail(value)){
      return " The email must be valid email";
    }
    return null;
  }

  String? _validatePassword(value) {
    if(value.lenght<8){
      return " The Password must be 8 charaters ";
    }
    return null;
  }
}
