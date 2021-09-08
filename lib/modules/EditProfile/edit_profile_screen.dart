import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/components/component.dart';
import 'package:social_app/components/defaultformfield.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';

class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (contex, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        nameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;
        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edit Profile', actions: [
            defaultTextButton(
                function: () {
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                text: 'Update'),
            SizedBox(
              width: 15,
            )
          ]),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              // if (state is SocialUserUpdateLoadingState)
              //   LinearProgressIndicator(),
              // if (state is SocialUserUpdateLoadingState) SizedBox(height: 10.0),
              // Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(4.0),
              //             topRight: Radius.circular(4.0)),
              //         image: DecorationImage(
              //             image: NetworkImage(
              //                 'https://image.freepik.com/free-psd/stylish-business-card-mockup_7838-454.jpg'),
              //             fit: BoxFit.cover))),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: profileImage == null
                          ? NetworkImage('${userModel.image}')
                          : FileImage(profileImage),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        SocialCubit.get(context).getProfileImage();
                      },
                      icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: Icon(
                            Icons.camera_alt_sharp,
                            size: 25,
                            color: Colors.white,
                          )))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              if (SocialCubit.get(context).profileImage != null)
                defaultButton(
                    function: () {
                      SocialCubit.get(context).uploadProfileImage(
                        name: nameController.text,
                        bio: bioController.text,
                        phone: phoneController.text,
                      );
                    },
                    text: 'upload profile image'),
              // if (state is SocialUserUpdateLoadingState) SizedBox(height: 5.0),

              // if (state is SocialUserUpdateLoadingState)
              //   LinearProgressIndicator(),
              SizedBox(
                height: 30,
              ),
              defaultTextField(
                  controller: nameController,
                  type: TextInputType.name,
                  text: 'Name',
                  prefix: Icons.person,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Name must not be empty';
                    }
                    return null;
                  }),
              SizedBox(
                height: 10,
              ),
              defaultTextField(
                  controller: bioController,
                  type: TextInputType.name,
                  text: 'Bio',
                  prefix: Icons.person,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Bio must not be empty';
                    }
                    return null;
                  }),

              SizedBox(
                height: 10.0,
              ),
              defaultTextField(
                  controller: phoneController,
                  type: TextInputType.phone,
                  text: 'Phone',
                  prefix: Icons.call,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Phone number must not be empty';
                    }
                    return null;
                  }),
            ]),
          ),
        );
      },
    );
  }
}
