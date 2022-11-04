import 'package:app_iot/constant/images.dart';
import 'package:app_iot/screens/register/model/register.dart';
import 'package:app_iot/widgets/dialog_error.dart';
import 'package:app_iot/widgets/dialog_loading.dart';
import 'package:app_iot/widgets/dialog_success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:app_iot/constant/routes.dart' as custom_route;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  RegisterModel myRegister = new RegisterModel();
  final Future<FirebaseApp> firbase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: firbase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(right: 30, left: 30, top: 40),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Center(
                        child: Image.asset(
                          logo,
                          width: 100,
                          height: 100,
                        ),
                      ),
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
                              'ລົງທະບຽນ',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.people),
                                labelText: 'ຊື່ ',
                              ),
                              onSaved: (String? value) {
                                setState(() {
                                  myRegister.firstName = value;
                                });
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'ກະລຸນາປ້ອນຊື່ຂອງທ່ານ'),
                              ]),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.people),
                                labelText: 'ນາມສະກຸນ',
                              ),
                              onSaved: (String? value) {
                                setState(() {
                                  myRegister.firstName = value;
                                });
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'ກະລຸນາປ້ອນນາມສະກຸນຂອງທ່ານ'),
                              ]),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                labelText: 'ອີເມວ ',
                              ),
                              onSaved: (String? value) {
                                myRegister.email = value;
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'ກະລຸນາປ້ອນອີເມວຂອງທ່ານ'),
                                EmailValidator(
                                    errorText: 'ຮູບແບບອີເມວຂອງທ່ານບໍ່ຖືກຕ້ອງ')
                              ]),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.key),
                                labelText: 'ລະຫັດຜ່ານ ',
                              ),
                              onSaved: (String? value) {
                                myRegister.password = value;
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'ກະລຸນາປ້ອນລະຫັດຜ່ານຂອງທ່ານ'),
                              ]),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
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
                                      print('Email ==> ${myRegister.email}');
                                      print(
                                          'Password == ${myRegister.password}');
                                      DialogLoading(context, 'ກຳລັງລົງທະບຽນ');
                                      try {
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: myRegister.email!,
                                                password: myRegister.password!);
                                        Navigator.pop(context);
                                        dialogSuccess(
                                            context,
                                            'ສຳເລັດ',
                                            'ທ່ານລົງທະບຽນສຳເລັດແລ້ວ\nກັບຄືນໄປໜ້າລັອກອິນ',
                                            'ຕົກລົງ',
                                            custom_route.Route.login);
                                      } on FirebaseAuthException catch (e) {
                                        Navigator.pop(context);
                                        print('Err ==> ${e.message}');
                                        if (e.message!.contains(
                                            'The email address is already in use by another account')) {
                                          dialogError(
                                              context,
                                              'ແຈ້ງເຕືອນ',
                                              'ບັນຊີຂອງທ່ານມີຢູ່ໃນລະບົບແລ້ວ\nລົງທະບຽນອີກຄັ້ງ',
                                              'ຕົກລົງ');
                                          // dialogError(context, 'ແຈ້ງເຕືອນ', 'ບັນຊີຂອງທ່ານມີຢູ່ໃນລະບົບແລ້ວ\nລົງທະບຽນອີກຄັ້ງ', 'ຕົກລົງ');
                                        } else if (e.message!.contains(
                                            'Password should be at least 6 characters')) {
                                          dialogError(
                                              context,
                                              'ແຈ້ງເຕືອນ',
                                              'ລະຫັດຜ່ານຄວນມີຢ່າງໜ້ອຍ 6 ຕົວອັກສອນ\nລົງທະບຽນອີກຄັ້ງ',
                                              'ຕົກລົງ');
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
                                    'ລົງທະບຽນ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            )
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
                            'ທ່ານມີບັນຊີເເລ້ວເເມ່ນບໍ?',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, custom_route.Route.login);
                              },
                              child: Text(
                                'ເຂົ້າສູ່ລະບົບ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
