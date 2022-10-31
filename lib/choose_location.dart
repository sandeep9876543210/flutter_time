import 'package:flutter/material.dart';
import 'package:flutter_time/loadng.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  void getdata() async{
   String status=await Future.delayed( Duration(seconds: 3),(){
     return('5 seconds waited');
      debugPrint("5 seconds waited");
    });
   String status1=await Future.delayed(Duration(seconds: 0),(){
     return('3 seconds waited');

    });
    print("we con't wait for you ${status}---${status1}");
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return Loading();
    }));

  }

  @override
  void initState() {
    debugPrint('initstate running');

    getdata();
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,

        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
                SpinKitFadingCube(
                color: Colors.white,size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
