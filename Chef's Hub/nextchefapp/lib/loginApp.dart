import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextchefapp/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyAppslogin());
}

class MyAppslogin extends StatelessWidget {
  const MyAppslogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Email Authentication App',
        home: ChooseScreen());
  }
}

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthClass().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginAndRegisterScreen();
        }
      },
    );
  }
}

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({super.key});
  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen> {
  bool loginScreenVisible = true;
  bool _obscureText = true; // Define _obscureText at the class level
  bool showLoading = false;
  String email = '';
  String password = '';

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loginScreenVisible ? 'Login' : 'Signup'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200, // Adjust the height as needed
              child: Image.asset(
                'assets/logo.png', // Replace 'your_image.png' with your image asset
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                children: [
                  inputField('email', Colors.green),
                  inputField('password', Colors.green),
                  !loginScreenVisible ? const SizedBox() : forgotPassword(),
                  loginRegisterButton(),
                  toggleIconButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Flutter textfield ///
  Widget inputField(String fieldType, Color borderColor) {
    bool isPasswordField = fieldType == 'password';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 16.0),
              obscureText: isPasswordField ? _obscureText : false,
              onChanged: (value) {
                setState(() {
                  if (isPasswordField) {
                    password = value;
                  } else {
                    email = value;
                  }
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText:
                    isPasswordField ? 'Enter password...' : 'Enter email...',
                suffixIcon: isPasswordField
                    ? InkWell(
                        onTap: _toggle,
                        child: Icon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: 15.0,
                          color: Colors.black,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Forgot password ///
  Widget forgotPassword() {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot password?',
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 13),
        ));
  }

  /// Login and Register Button
  Widget loginRegisterButton() {
    return Padding(
      padding: EdgeInsets.only(top: 31, bottom: 21),
      child: MaterialButton(
          onPressed: email.isEmpty || password.isEmpty
              ? null
              : () async {
                  setState(() {});
                  showLoading = true;
                  if (loginScreenVisible) {
                    try {
                      print('get it now');
                      await AuthClass().signIn(email, password);
                      print('get it');
                    } on FirebaseAuthException {
                      if (AuthClass().currentUser == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Invalid email or password')));
                      }
                    }
                    setState(() {
                      showLoading = false;
                    });
                  }
                  if (!loginScreenVisible) {
                    try {
                      await AuthClass().register(email, password);
                    } on FirebaseAuthException {
                      var res = await AuthClass()
                          .auth
                          .fetchSignInMethodsForEmail(email);
                      if (res.isNotEmpty)
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User already exists')));
                    }
                    setState(() {
                      showLoading = false;
                    });
                  }
                },
          padding: EdgeInsets.symmetric(vertical: 13),
          minWidth: double.infinity,
          color: Colors.green,
          disabledColor: Colors.grey.shade300,
          textColor: Colors.white,
          child: showLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(loginScreenVisible ? 'Login' : 'Register')),
    );
  }

  /// custom toggle button ///
  Widget toggleIconButton() {
    return InkWell(
      onTap: () {
        setState(() {
          loginScreenVisible = !loginScreenVisible;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            loginScreenVisible
                ? toggleButtonText()
                : Expanded(
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
            !loginScreenVisible
                ? toggleButtonText()
                : Expanded(
                    child: Center(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget toggleButtonText() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        child: Text(
          loginScreenVisible ? 'Login' : 'Signup',
          style: TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
}

//// home screen ///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = AuthClass().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Home Screen'),
        actions: [
          MaterialButton(
              onPressed: () async {
                await AuthClass().signOut();
              },
              child: Text('Signout', style: TextStyle(color: Colors.white)))
        ],
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(3, 3),
                      color: Colors.grey.shade200)
                ]),
            child: Text(
                user!.email!.isEmpty ? 'No data' : user!.email.toString())),
      ),
    );
  }
}

/// Firebase Operations ///
class AuthClass {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<void> signIn(email, password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register(email, password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
