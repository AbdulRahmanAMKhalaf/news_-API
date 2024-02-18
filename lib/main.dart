import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/Cubit/CubitStates.dart';

import 'Cubit/BlocObserver.dart';
import 'Cubit/CubitApp.dart';
import 'HomeLayoutScreen/HomeLayoutScreen.dart';
import 'Share/Components/Components.dart';
import 'Share/DioHelper/DioHelper.dart';
import 'Share/PreferenceHelper/SharedPreference.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initialDioHelper();
  await  PreferenceHelper.initialPreference();
  Bloc.observer = MyBlocObserver();
//  ThemeMode ?theme =PreferenceHelper.getData(key: 'Theme')==true?ThemeMode.light:ThemeMode.dark;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CubitApp()..getNewsData(
              query: {
                "country":"us",
                "category":"business",
                "apiKey":"bc2439e97fb445498a522168371c3941",
              }
          )..getSciencesData(
              query:  {
                "country":"us",
                "category":"science",
                "apiKey":"bc2439e97fb445498a522168371c3941",
              }
          )..getSportsData(
              query: {
                "country":"us",
                "category":"sport",
                "apiKey":"bc2439e97fb445498a522168371c3941",
              }
          ),
        ),
      ],
      child: BlocConsumer<CubitApp,CubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              theme:whiteTheme(),
          darkTheme: darkTheme(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: HomeLayoutScreen(),
          );
        },
        ),
    );
  }
}

