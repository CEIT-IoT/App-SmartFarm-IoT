import 'package:app_iot/screens/login/components/logo.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  get formKey => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
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
                          color: Colors.grey,
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
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.code),
                              labelText: 'ລະຫັດຜ່ານ ',
                            ),
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
                                onPressed: () async {},
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
                    // Row(children: <Widget>[
                    //   buildDivider(),
                    //   Text("ຫຼື"),
                    //   buildDivider(),
                    // ]),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.pushNamed(
                    //             context, custom_route.Route.selectMenu);
                    //       },
                    //       child: Image.asset(
                    //         icFacebook,
                    //         width: 30,
                    //         height: 30,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         await processSignInWithGoogle();
                    //         Navigator.pushNamed(
                    //             context, custom_route.Route.selectMenu);
                    //       },
                    //       child: Image.asset(
                    //         icGoogle,
                    //         width: 30,
                    //         height: 30,
                    //       ),
                    //     )
                    //   ],
                    // ),
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
                            onTap: () {},
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
