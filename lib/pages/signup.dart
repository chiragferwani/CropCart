import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/login.dart';
import 'navigation.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                // Phone Number Field  <-- Added phone number field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Enter Phone Number',
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
                    if (value == null || value.isEmpty || value.length != 10) { // Example: 10-digit validation
                      return 'Please enter a valid 10-digit phone number';
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
                SizedBox(height: 10,),
                // Confirm Password Field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
                    if (value == null || value.isEmpty || value != _passwordController.text) {
                      return 'Passwords do not match';
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
                    onPressed: _isLoading ? null : _signUp,
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('SIGN UP', style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 20),),
                  ),
                ),

                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginUpScreen()));
                  },
                  child: Text("Already have an account? LOGIN",
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