import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Modules/NewsScreen.dart';
import '../../Modules/ScienceScreen.dart';
import '../../Modules/SportsScreen.dart';
List<BottomNavigationBarItem> BottomNavigationItem=
    [
      BottomNavigationBarItem(
        icon: Icon(Icons.newspaper),
        label: 'News',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports',
      ),
    ];
List<Widget>Screens=[
  NewsScreen(),
  ScienceScreen(),
  SportsScreen(),
];

Widget listAPI({
  List<dynamic> ?listOfInfo,
}){
  String emImage="https://www.muratyaman.co.uk/blog/wp-content/uploads/2017/11/error.jpg";
  String ?nullItem=null;
  return ListView.separated(
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Image(
                  image: NetworkImage(
                    // '${emImage}',
                    "${listOfInfo[index]["urlToImage"]}"==null?emImage:"${listOfInfo[index]["urlToImage"]}",
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text("${listOfInfo[index]["title"]}"==nullItem?"no title found":"${listOfInfo[index]["title"]}",
                        maxLines:2,
                        overflow:TextOverflow.ellipsis ,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("${listOfInfo[index]["author"]}"==nullItem? "no author found":"${listOfInfo[index]["author"]}",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    separatorBuilder: (context, index) => SizedBox(height: 10),
    itemCount:listOfInfo!.length,
  );
}

ThemeData whiteTheme(){
  return ThemeData(
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        color: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
          size: 25,
        )
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.black
      ),
    ),
    primaryColorLight: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(
        color: Colors.grey[600],
      ),
      selectedIconTheme: IconThemeData(
        color: Colors.deepOrange,
      ),
      backgroundColor: Colors.white,
    ),
  );
}
ThemeData darkTheme(){
  return ThemeData(
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        color: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
          size: 25,
        )
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white
      ),
    ),
    primaryColorLight: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(
        color: Colors.white70,
      ),
      selectedIconTheme: IconThemeData(
        color: Colors.deepOrange,
      ),
      backgroundColor: Colors.black,
    ),
  );
}