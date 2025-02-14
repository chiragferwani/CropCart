import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/signup.dart';
import 'navigation.dart';

class LoginUpScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController(); // Added phone controller
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/cropcart.png', height: 200),
                SizedBox(height: 20),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    labelStyle: TextStyle(fontFamily: 'boldfont', color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, 
                            color: Colors.black,
                            
                            ),
                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                
                SizedBox(height: 10,),
                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(fontFamily: 'boldfont', color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, 
                            color: Colors.black,
                            
                            ),
                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                

                SizedBox(height: 20),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // TODO: do not hardcode colors - use theming instead!
                        foregroundColor: Colors.black, // foreground (text) color
                        backgroundColor: Color.fromARGB(255, 126, 217, 87), // background color
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.black,
                        ),
                      ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
                    },
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('LOGIN', style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 20),),
                  ),
                ),

                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  },
                  child: Text("Don't have an account? SIGNUP",
                  style: TextStyle(
                    fontFamily: 'boldfont',
                    fontSize: 18,
                    
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Simulate sign-up process (replace with your actual logic)
        await Future.delayed(Duration(seconds: 2));

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed: $error')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}