import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/form_field_contents.dart';
import 'package:test_project/validations/validator.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;
  const LoginForm({
    super.key, required this.focusNode});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,);
  }

  final _loginInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 6.0,
              right: 6.0,
              bottom: 20.0
            ),
            child: Column(
              children: [
                FormFieldContent(
                  controller: _emailController,
                  focusNode: widget.focusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  label: 'Email Address',
                  hint: 'Enter your email address',
                  Validator: (value) => Validator.validateUserid(user_id: value)
                  ),
                FormFieldContent(
                  controller: _passwordController,
                  focusNode: widget.focusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  label: 'Password',
                  hint: 'Enter your password',
                  Validator: (value) => Validator.validatePassword(password: value)
                  ),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 0.0,
                right: 0.0,
              ),
              child: Container(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ),
                  onPressed: (){
                    widget.focusNode.unfocus();



                    // if(_loginInFormKey.currentState!.validate()){
                    //   Database.user_id = _userIdController.text;

                    //   Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) => HomePage(),
                    //     )
                    //   );
                    // }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0
                  ),
                  child: Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                  ),
                  ),
                ),
              ),
              )
        ],
      ),
    );
  }
}