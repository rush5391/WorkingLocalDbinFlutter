import 'package:flutter/material.dart';
import 'package:newtasksqlite/dashboard.dart';
import 'login_response.dart';
import 'model/users.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State<LoginPage> implements LoginCallBack {
 late BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
 late String _username, _password;
 late LoginResponse _response;

  _LoginPageState() {
    _response = new LoginResponse(this);
  }
  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form!.save();
        _response.doLogin(_username, _password);
      });
    }
  }
  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ElevatedButton(
      onPressed: _submit,
      child: new Text("Login"),
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10,),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val!,
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val!,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }
  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void onLoginSuccess(User user) async {
    if(user != null){
      _showSnackBar("Login failed");

    }else{
      // TODO: implement onLoginSuccess
      _showSnackBar("Login Success");
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,MaterialPageRoute(builder: (context) => DashBoard()),);

    }

  }
}