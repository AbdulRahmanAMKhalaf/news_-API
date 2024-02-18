import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/CubitApp.dart';
import '../Cubit/CubitStates.dart';
import '../Share/Components/Components.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context)  {
    return  BlocConsumer<CubitApp,CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitApp cubitApp=CubitApp.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text('News App',
            ),
            actions: [
              IconButton(
                  onPressed:(){},
                  icon: Icon(Icons.search)
              ),
              SizedBox(width: 5,),
              IconButton(
                  onPressed:(){
                    //return here
                    //  cubitApp.changeThemeMode();
                  },
                  icon: Icon(cubitApp.isWhite==true?Icons.brightness_2:Icons.brightness_4),
              ),
            ],
          ),
          body: Screens[cubitApp.index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepOrange,
            items: BottomNavigationItem,
            currentIndex: cubitApp.index,
            onTap: (value) {
              cubitApp.changeBottemNavigationIndex(value);
            },
          ),
        );
      },
    );
  }
}
