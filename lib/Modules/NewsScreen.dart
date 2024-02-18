import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/CubitApp.dart';
import '../Cubit/CubitStates.dart';
import '../Share/Components/Components.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  ConditionalBuilder(
            condition: state is! uploadeState,
            builder:(context) => listAPI(listOfInfo: CubitApp.get(context).BussinessList) ,
            fallback:(context) => Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),

        );
      },
    );
  }
}
/*Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            //return point
          foregroundImage: NetworkImage(""),
          radius: 45,
            backgroundColor: Colors.greenAccent,
      ),
          SizedBox(width: 15,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal
              ),
              ),
              SizedBox(height: 20,),
              Text("Author",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
