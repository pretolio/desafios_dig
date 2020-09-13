import 'package:flutter/material.dart';

loadTela(context){
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context){
        return  Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,),);
      }
  );
}