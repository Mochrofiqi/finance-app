import 'package:flutter/material.dart';

import '../database/dbhelper.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var db = DBHelper();

  updatePassword() async {
    var res = await db.getPassword();

    if (passwordInput.text.toString() == res.toString()) {
      await db.updatePassword(confirmPasswordInput.text.toString());
      _scaffoldKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Password changed successfully!'),
        ),
      );
    } else {
      _scaffoldKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Passwords not same!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey[600], 
                        ),
                        alignment: Alignment.center, 
                        child: Text(
                          'Setting',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password Now :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Now Required!';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: passwordInput,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'New Password :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required!';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: confirmPasswordInput,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    updatePassword();
                  }
                },
                child: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[600],
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          )),
      key: _scaffoldKey,
    );
  }
}
