import 'package:flutter/material.dart';
// importing firebase libraries
import 'Login_screen.dart';

class registrationPage extends StatefulWidget {
  const registrationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _registrationPageState createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight), // Padding
            buildTitle(), // Sign up
            buildTitleLine(), // The line underneath the Sign up title
            const SizedBox(height: 60),
            buildEmailTextField(), // enter your eamil address
            const SizedBox(height: 30),
            buildPasswordTextField(context), // enter your password

            const SizedBox(height: 90),
            buildLoginButton(context), // register button
            const SizedBox(height: 90),
            buildGobackButton(context), // register button
          ],
        ),
      ),
    );
  }

  Widget buildGobackButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              // circular corner
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text('Go back',
              style: Theme.of(context).primaryTextTheme.headlineSmall),
          onPressed: () async {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const loginPage(title: "Log in")));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Back to the login page"),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              // circular corner
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text('Sign Up',
              style: Theme.of(context).primaryTextTheme.headlineSmall),
          onPressed: () async {
            final message = await AuthService().registration(
              email: _email.text,
              password: _password.text,
            );
            if (message!.contains('Success')) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const loginPage(title: "Log in")));
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // show entered password
        controller: _password,
        validator: (v) {
          if (v!.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                //  setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildEmailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email Address'),
      validator: (v) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(v!)) {
          return 'Please enter a correct email address';
        }
        return null;
      },
      controller: _email,
    );
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Sign up',
          style: TextStyle(fontSize: 42),
        ));
  }
}
