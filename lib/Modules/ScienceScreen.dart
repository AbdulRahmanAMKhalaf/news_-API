import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/CubitApp.dart';
import '../Cubit/CubitStates.dart';
import '../Share/Components/Components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  ConditionalBuilder(
          condition: state is! uploadeState,
          builder:(context) => listAPI(listOfInfo: CubitApp.get(context).ScienceList) ,
          fallback:(context) => Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),

        );
      },
    );
  }
}
