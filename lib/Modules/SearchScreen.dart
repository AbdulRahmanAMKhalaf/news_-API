import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/CubitApp.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
   TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        CubitApp cubitApp=CubitApp.get(context);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Scaffold(
              body: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    onChanged: (value) {

                    },
                    decoration: InputDecoration(
                      suffixIconColor: Colors.deepOrange,
                      suffixIcon: Icon(Icons.search),
                      labelText: "search",
                      labelStyle: TextStyle(
                        color: Colors.deepOrange,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
