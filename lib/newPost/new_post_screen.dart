import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/components/component.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';

class NewPostScreen extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Text('Create Post'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              actions: [
                defaultTextButton(
                    function: () {
                      var now = DateTime.now();
                      if (SocialCubit.get(context).postImage == null) {
                        SocialCubit.get(context).createPost(
                            text: textController.text,
                            dateTime: now.toString());
                      } else {
                        SocialCubit.get(context).uploadPostImage(
                            dateTime: now.toString(),
                            text: textController.text);
                      }
                    },
                    text: 'Post')
              ]),
          body: Column(
            children: [
              if (state is SocialCreatePostLoadingState)
                LinearProgressIndicator(),
              if (state is SocialCreatePostLoadingState)
                SizedBox(
                  height: 10.0,
                ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Mohammed Ahmed',
                      style: TextStyle(
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'What is on your mind',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
              ),
              if (SocialCubit.get(context).postImage != null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                                image: FileImage(
                                    SocialCubit.get(context).postImage),
                                fit: BoxFit.cover))),
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          SocialCubit.get(context).removePostImage();
                        },
                        icon: CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.close,
                            size: 16.0,
                          ),
                        ))
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo),
                            SizedBox(width: 5),
                            Text('Add photo')
                          ],
                        )),
                  ),
                  Expanded(
                    child: TextButton(onPressed: () {}, child: Text('#tags')),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
