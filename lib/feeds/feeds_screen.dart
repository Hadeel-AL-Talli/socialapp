import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/style/colors.dart';
import 'package:social_app/style/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: SocialCubit.get(context).posts.length > 0 &&
                SocialCubit.get(context).userModel != null,
            builder: (context) => SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10.0,
                          margin: EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Image(
                                  image: NetworkImage(
                                      'https://image.freepik.com/free-psd/stylish-business-card-mockup_7838-454.jpg'),
                                  fit: BoxFit.cover,
                                  height: 200.0,
                                  width: double.infinity),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Communicate with friends',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              )
                            ],
                          )),
                      ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.0,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildPostItem(
                            SocialCubit.get(context).posts[index],
                            context,
                            index),
                        itemCount: SocialCubit.get(context).posts.length,
                      ),
                      SizedBox(
                        height: 8.0,
                      )
                    ],
                  ),
                ),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}

Widget buildPostItem(PostModel model, context, index) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${model.image}'),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                      children: [
                        Text('${model.name}',
                            style: TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 14,
                        )
                      ],
                    ),
                    Text(
                      '${model.dateTime}',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(height: 1.4),
                    )
                  ])),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 16,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          Text(
            '${model.text}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            child: Container(
              width: double.infinity,
              child: Wrap(children: [
                // Container(
                //   height: 20.0,
                //   child: MaterialButton(
                //       onPressed: () {},
                //       minWidth: 1.0,
                //       padding: EdgeInsets.zero,
                //       child: Padding(
                //         padding: const EdgeInsetsDirectional.only(end: 6.0),
                //         child: Text('#software',
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .caption
                //                 .copyWith(color: defaultColor)),
                //       )),
                // ),
                // Container(
                //   height: 20.0,
                //   child: MaterialButton(
                //       onPressed: () {},
                //       minWidth: 1.0,
                //       padding: EdgeInsets.zero,
                //       child: Padding(
                //         padding: const EdgeInsetsDirectional.only(end: 6),
                //         child: Text('#software_development',
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .caption
                //                 .copyWith(color: defaultColor)),
                //       )),
                // ),
              ]),
            ),
          ),
          if (model.image != '')
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15),
              child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: NetworkImage('${model.postImage}'),
                        fit: BoxFit.cover,
                      ))),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 20.0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('${SocialCubit.get(context).likes[index]}',
                              style: Theme.of(context).textTheme.caption)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: 20.0,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('0 comments',
                              style: Theme.of(context).textTheme.caption)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Row(children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundImage: NetworkImage(
                          '${SocialCubit.get(context).userModel.image}'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Write a Comment ...',
                        style: Theme.of(context).textTheme.caption)
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  SocialCubit.get(context)
                      .likePost(SocialCubit.get(context).postsId[index]);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 20.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Like', style: Theme.of(context).textTheme.caption)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
