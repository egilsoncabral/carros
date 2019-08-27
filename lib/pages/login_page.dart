import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: _body(),),
    );
  }

  String _validateLogin(String text){
    if(text.isEmpty){
      return "Informe o login";
    }
    return null;
  }

  String _validateSenha(String text){
    if(text.isEmpty){
      return "Informe a senha";
    }
    if(text.length <= 2){
      return "Senha precisa ter mais de 2 números";
    }
    return null;
  }

  _body() {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _tLogin,
            validator: _validateLogin,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(color: Colors.black, fontSize: 25),
              hintText: "Digite seu login",
              hintStyle: TextStyle(color: Colors.black, fontSize: 18)
            ),
          ),
          TextFormField(
            controller: _tSenha,
            validator: _validateSenha,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.black, fontSize: 25),
              hintText: "Digite a sua senha",
              hintStyle: TextStyle(color: Colors.black, fontSize: 18)
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 25),),
              onPressed: _onLoginClick
          ),)
        ],
      ),
    );
  }
  
  void _onLoginClick(){
    final login = _tLogin.text;
    final senha = _tSenha.text;

    if (!_formKey.currentState.validate()) {
      return;
    }
    print("Login");
  }
}
