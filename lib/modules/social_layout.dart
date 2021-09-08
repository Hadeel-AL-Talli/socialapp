import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/components/component.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/newPost/new_post_screen.dart';
import 'package:social_app/style/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],

          // ConditionalBuilder(
          //   condition: SocialCubit.get(context).model != null,
          //   builder: (context) {
          //     var model = SocialCubit.get(context).model;
          //     return Column(
          //       children: [
          //         if (!FirebaseAuth.instance.currentUser.emailVerified)
          //           Container(
          //             color: Colors.amber.withOpacity(.6),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 20),
          //               child: Row(
          //                 children: [
          //                   Icon(Icons.info_outline),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   Expanded(
          //                       child: Text('please verify your email',
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .bodyText1)),
          //                   //Spacer(),
          //                   // SizedBox(
          //                   //   width: 20,
          //                   // ),
          //                   defaultTextButton(
          //                       function: () {
          //                         FirebaseAuth.instance.currentUser
          //                             .sendEmailVerification()
          //                             .then((value) {
          //                           Fluttertoast.showToast(
          //                               msg: 'Check Your mail',
          //                               toastLength: Toast.LENGTH_SHORT,
          //                               timeInSecForIosWeb: 1,
          //                               backgroundColor: Colors.blue,
          //                               textColor: Colors.white,
          //                               fontSize: 16.0);
          //                         }).catchError((error) {});
          //                       },
          //                       text: 'send')
          //                 ],
          //               ),
          //             ),
          //           )
          //       ],
          //     );
          //   },
          //   fallback: (context) =>
          //       Center(child: CircularProgressIndicator()),
          // ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              //BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_history), label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewPostScreen()));
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
