import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/components/component.dart';
import 'package:social_app/components/defaultformfield.dart';
import 'package:social_app/local/cache_helper.dart';
import 'package:social_app/modules/social%20login%20screen/social_login_cubit.dart';

import 'package:social_app/modules/social%20login%20screen/social_login_states.dart';
import 'package:social_app/modules/social%20register%20screen/register_screen.dart';
import 'package:social_app/modules/social_layout.dart';

class Login extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
          listener: (context, state) {
        if (state is SocialLoginErrorState) {
          // Fluttertoast.showToast(
          //     msg:
          //         'Sorry! we cant find your email in our database ! please Register ',
          //     toastLength: Toast.LENGTH_SHORT,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.orange,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        }
        if (state is SocialLoginSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navigateAndFinish(context, SocialLayout());
          });
        }
      }, builder: (context, state) {
        return Scaffold(
            // appBar: AppBar(

            // ),
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'login now to communicate with your friends ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    defaultTextField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter your email address';
                          }
                        },
                        text: 'Email Address',
                        prefix: Icons.email),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultTextField(
                      suffix: SocialLoginCubit.get(context).suffix,
                      onSubmit: (value) {
                        if (formKey.currentState.validate()) {
                          // SocialLoginCubit.get(context).userLogin(
                          //     email: emailController.text,
                          //     password: passwordController.text);
                        }
                      },
                      isPassword: SocialLoginCubit.get(context).isPassword,
                      suffixFunction: () {
                        SocialLoginCubit.get(context)
                            .changePasswordVisibility();
                      },
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Password is too short ';
                        }
                      },
                      text: 'Password',
                      prefix: Icons.lock_outline,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! SocialLoginLoadingState,
                      builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: 'Login'),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, RegisterScreen());
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      }),
    );
  }
}
