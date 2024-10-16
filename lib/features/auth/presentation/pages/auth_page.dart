import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/helper/styles_text.dart';
import 'package:my_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_app/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:my_app/features/auth/presentation/widgets/input_auth_custom.dart';
import 'package:my_app/main.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final authbloc = context.read<AuthBloc>();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) + 20,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 53, 238, 59),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(100, 100),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.music_note,
                            size: 60,
                            color: Colors.white,
                          ),
                          Text(
                            "Spotify",
                            style: StylesText.robotoBold(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Millions of songs, free on spotify",
                        style: StylesText.robotoBold(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.7 + 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "Login Account",
                            style: StylesText.robotoBold(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        InputCustomFiled(
                          controller: authbloc.email,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          icons: Icon(Icons.mark_as_unread_sharp),
                          label: "Email or Username",
                        ),
                        InputCustomFiled(
                          controller: authbloc.password,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          ispassword: true,
                          label: "Password",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remember me",
                                style: StylesText.robotoBold(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                              Switch(
                                value: state.isremember ?? false,
                                onChanged: (value) {
                                  authbloc.add(AuthEvent.onChangeRemember());
                                },
                                thumbColor: WidgetStatePropertyAll(
                                  state.isremember!
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        ButtonCustomAuth(
                          onPressed: () {},
                          title: 'LOG IN',
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
