import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/components/component.dart';
import 'package:social_app/components/defaultformfield.dart';
import 'package:social_app/modules/social%20login%20screen/social_login.dart';
import 'package:social_app/modules/social%20register%20screen/register_cubit/register_cubit.dart';
import 'package:social_app/modules/social%20register%20screen/register_cubit/register_states.dart';
import 'package:social_app/modules/social_layout.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameControl = TextEditingController();
  var phoneControl = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SocialRegisterCubit(),
        child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
          listener: (context, state) {
            if (state is SocialCreateUserSuccessState) {
              navigateAndFinish(context, SocialLayout());
            }
          },
          builder: (context, state) {
            SocialRegisterCubit cubit = SocialRegisterCubit.get(context);

            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  centerTitle: true,
                  // title: Text('Register',
                  // style: TextStyle(
                  //   color: Colors.indigo,
                  //   fontWeight: FontWeight.w600,
                  //   fontSize: 25,
                  // ),),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white),
                  backgroundColor: Colors.white,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            'Register',
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
                            height: 20,
                          ),
                          defaultTextField(
                              validate: () {},
                              onSubmit: (value) {
                                print(value);
                              },
                              onTap: () {},
                              textForUnValid: 'Enter your name',
                              controller: nameControl,
                              type: TextInputType.emailAddress,
                              text: 'Name',
                              prefix: Icons.person),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextField(
                              validate: () {},
                              onSubmit: (value) {
                                print(value);
                              },
                              onTap: () {},
                              textForUnValid: 'Enter your email',
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              text: 'Email',
                              prefix: Icons.email_outlined),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextField(
                              validate: () {},
                              onSubmit: (value) {
                                print(value);
                              },
                              onTap: () {},
                              textForUnValid: 'Enter your phone',
                              controller: phoneControl,
                              type: TextInputType.phone,
                              text: 'Phone',
                              prefix: Icons.phone),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextField(
                              validate: () {},
                              onSubmit: (value) {
                                if (formKey.currentState.validate() == true) {
                                  // cubit.userRegister(
                                  //     phone: phoneControl.text,
                                  //     name: nameControl.text,
                                  //     email: emailController.text,
                                  //     password: passwordController.text);
                                }
                              },
                              onTap: () {},
                              textForUnValid: 'Enter you password',
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              text: 'Password',
                              prefix: Icons.lock,
                              isPassword: cubit.isPassword,
                              suffix: cubit.isPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              suffixFunction: () {
                                cubit.changePasswordShow();
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is! SocialRegisterLoadingState,
                            builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState.validate() == true) {
                                    cubit.userRegister(
                                        phone: phoneControl.text,
                                        name: nameControl.text,
                                        email: emailController.text,
                                        password: passwordController.text);
                                  } else {
                                    print('error');
                                  }
                                },
                                text: 'Register'),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                         Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Do you have an account?'),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, Login());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
