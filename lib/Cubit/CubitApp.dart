import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Share/DioHelper/DioHelper.dart';
import 'CubitStates.dart';


class CubitApp extends Cubit<CubitStates> {
  CubitApp() : super(InitialState());

  static CubitApp get(context) => BlocProvider.of(context);

  int index = 0;

  void changeBottemNavigationIndex(int value) {
    index = value;
    emit(changeBottemNavigationBarButton());
  }
  List<dynamic> BussinessList=[];
  List<dynamic> ScienceList=[];
  List<dynamic> SportsList=[];
  List<dynamic> SearchList=[];

  void getNewsData({
    required Map<String, dynamic> query
  }) {
    emit(uploadeState());
    DioHelper.getData(
        query: query
    ).then((value) {
      BussinessList=value.data["articles"];
      // print(value.data.toString());
      emit(getDataNewsSuccessfully());
    }).catchError((Error) {
      print(Error.toString());
      emit(getDataNewsError());
    });
  }

  void getSciencesData({
    required Map<String, dynamic> query
  }) {
    emit(uploadeState());
    DioHelper.getData(
        query: query
    ).then((value) {
      ScienceList=value.data["articles"];
      // print(value.data.toString());
      emit(getDataScienceSuccessfully());
    }).catchError((Error) {
      print(Error.toString());
      emit(getDataScienceError());
    });
  }

  void getSportsData({
    required Map<String, dynamic> query
  }) {
    emit(uploadeState());
    DioHelper.getData(
        query: query
    ).then((value) {
      SportsList=value.data["articles"];
      // print(value.data.toString());
      emit(getDataSportsSuccessfully());
    }).catchError((Error) {
      print(Error.toString());
      emit(getDataSportsError());
    });
  }

  void getSearchData({
    required Map<String, dynamic> query
  }) {
    emit(uploadeState());
    DioHelper.getData(
        query: query
    ).then((value) {
      SearchList=value.data["articles"];
      // print(value.data.toString());
      emit(getDataNewsSuccessfully());
    }).catchError((Error) {
      print(Error.toString());
      emit(getDataNewsError());
    });
  }
  bool isWhite=true;
 void changeThemeMode(){
    isWhite!=isWhite;
    print(isWhite);
    emit(changeThemeModeState());
  }
}