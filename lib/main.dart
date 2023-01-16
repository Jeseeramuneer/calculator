
//import 'package:calculator/Calcbutton.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late int first,second;
  late String opp;
  late String result,text="";

  void btnClicked(String btnText){
    if(btnText=="c"){
      print("case1");
      result="";
      text="";
      first=0;
      second=0;
    }else if(btnText=="+"|| btnText=="-" || btnText=="x" || btnText=="/"){
      print("case2");
      first=int.parse(text);
      result="";
      opp=btnText;
    }else if(btnText == "="){
      print("case3");
      second=int.parse(text);
      if(opp=="+"){
        result=(first + second).toString();
      }if(opp=="-"){
        result=(first - second).toString();
      }if(opp=="x"){
        result=(first * second).toString();
      }if(opp=="/"){
        result=(first ~/ second).toString();
      }
    }else{
      print("case4");
      result=int.parse(text+btnText).toString();
    }
    setState(() {
      text=result;
    });
  }

  Widget CustomOutlineButton(String value ){
    return Expanded(child:
    OutlinedButton(
      onPressed: ()=>
          btnClicked(value),

      child: Text(value,
        style: TextStyle(fontSize: 25),
      ),
    ),
    );
  }

Widget Calcbutton(String btntxt,btncolor,txtcolor){
  return Container(
    margin: EdgeInsets.all(10),
    child: SizedBox(
        width: 65,
        height: 65,
        child: OutlinedButton(
          onPressed: () {  btnClicked(btntxt);


          },
          child: Text(btntxt,),
            style:ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btncolor),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
             )
             ),

          ),
        )
    );



}
  @override
  Widget build(BuildContext context) {
   // Color btclr:Colors.grey[850];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column
      (mainAxisAlignment: MainAxisAlignment.end,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(text,textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white,
                  fontSize: 100),
                  )
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calcbutton('7',Colors.grey[850],Colors.white),
                Calcbutton('8',Colors.grey[850],Colors.white),
                Calcbutton('9',Colors.grey[850],Colors.white),
                Calcbutton('*',Colors.amber[700],Colors.white)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calcbutton('4',Colors.grey[850],Colors.white),
                Calcbutton('5',Colors.grey[850],Colors.white),
                Calcbutton('6',Colors.grey[850],Colors.white),
                Calcbutton('-',Colors.amber[700],Colors.white)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calcbutton('1',Colors.grey[850],Colors.white),
                Calcbutton('2',Colors.grey[850],Colors.white),
                Calcbutton('3',Colors.grey[850],Colors.white),
                Calcbutton('+',Colors.amber[700],Colors.white)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calcbutton("C",Colors.grey,Colors.black),
                Calcbutton("=",Colors.grey,Colors.black),
                Calcbutton('0',Colors.grey,Colors.black),
                Calcbutton('/',Colors.yellow,Colors.black)
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                  child: OutlinedButton(
                      onPressed: (){},
                    child: Text("0",style: TextStyle(
                      fontSize: 32,
                      color: Colors.white
                    ),),
                  ),),
              ],
            )*/
          ],
      ),
    );
  }
}
