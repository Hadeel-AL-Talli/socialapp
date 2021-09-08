import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/local/cache_helper.dart';
import 'package:social_app/modules/social%20login%20screen/social_login.dart';
import 'package:social_app/modules/social%20register%20screen/register_screen.dart';
import 'package:social_app/modules/social_layout.dart';
import 'package:social_app/style/themes.dart';

import 'components/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Widget startwidget;
  
 uId = CacheHelper.importData(key: 'uId');
  if (uId != null) {
    startwidget = SocialLayout();
  } else {
    startwidget = Login();
  }
  runApp(MyApp(startwidget));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  MyApp(this.startwidget);
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context)=>SocialCubit()..getUserData()..getPosts(),
     child: BlocConsumer<SocialCubit , SocialStates>(
       listener: (context, state) {},
       builder: (context, state) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: lightTheme,
           
           
         home: SocialLayout()
        // home:Login(),
         );
       },
     ),
   );
  }
}



// return MultiBlocProvider(
//       providers: [],
//       child: BlocConsumer(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: lightTheme,
            
            
//             home: RegisterScreen(),
//           );
//         },
//       ),
//     );