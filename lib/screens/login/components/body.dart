import 'package:app_iot/model/profile.dart';
import 'package:app_iot/screens/login/components/logo.dart';
import 'package:app_iot/utilities/pref_login.dart';
import 'package:app_iot/widgets/dialog_error.dart';
import 'package:app_iot/widgets/dialog_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:app_iot/constant/routes.dart' as custom_route;

class Body extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  Profile profile = new Profile();
  final Future<FirebaseApp> firbase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Logo(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10.0, 10.0),
                                blurRadius: 5,
                                spreadRadius: 0.0,
                                color: Colors.black.withOpacity(0.3))
                          ]),
                      child: Column(
                        children: [
                          Text(
                            'ເຂົ້າສູ່ລະບົບ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'ອີເມວ ',
                            ),
                            onSaved: (String? email) {
                              profile.email = email!;
                            },
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "ກະລຸນາປ້ອນອີເມວຂອງທ່ານ"),
                              EmailValidator(
                                  errorText: "ຮູບແບບອີເມວຂອງທ່ານບໍ່ຖືກຕ້ອງ")
                            ]),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.code),
                              labelText: 'ລະຫັດຜ່ານ ',
                            ),
                            onSaved: (String? password) {
                              profile.password = password!;
                            },
                            validator: RequiredValidator(
                                errorText: "ກະລຸນາປ້ອນລະຫັດຜ່ານ"),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: new LinearGradient(
                                  colors: [Colors.blue, Colors.blueGrey],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight,
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    DialogLoading(
                                        context, "ກຳລັງເຂົ້າສູ່ລະບົບ...");
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: profile.email.toString(),
                                              password:
                                                  profile.password.toString())
                                          .then((value) async {
                                        await LoginPreference()
                                            .setPrefEmailLogin(profile.email!);
                                        await LoginPreference()
                                            .setPrefEmailLogin(profile.email!);
                                        formKey.currentState!.reset();
                                        Navigator.pop(context);
                                        Navigator.pushReplacementNamed(
                                            context, custom_route.Route.home);
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      print('Error login ==> ${e.message}');
                                      Navigator.pop(context);
                                      if (e.message!.contains(
                                          'The password is invalid')) {
                                        dialogError(
                                            context,
                                            'ແຈ້ງເຕືອນ',
                                            'ຂໍ້ມູນຂອງທ່ານບໍ່ຖືກຕ້ອງ\nລອງໃໝ່ອີກຄັ້ງ',
                                            'ຕົກລົງ');
                                      } else if (e.message!.contains(
                                          'There is no user record corresponding to this identifier')) {
                                        formKey.currentState!.reset();
                                        dialogError(
                                            context,
                                            'ແຈ້ງເຕືອນ',
                                            'ບັນຊີຂອງທ່ານບໍ່ມີຢູ່ໃນລະບົບກະລຸນາ\nລົງທະບຽນກ່ອນ',
                                            'ປິດ');
                                      } else {
                                        dialogError(
                                            context,
                                            'ຂໍອະໄພ',
                                            'ລະບົບມີບັນຫາ, ກະລຸນາ\nລອງໃໝ່ອີກຄັ້ງ',
                                            'ຕົກລົງ');
                                      }
                                    }
                                  }
                                },
                                child: Text(
                                  'ເຂົ້າສູ່ລະບົບ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ຍັງບໍ່ທັນມີບັນຊີແມ່ນບໍ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, custom_route.Route.register);
                            },
                            child: Text(
                              'ລົງທະບຽນ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                    SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
