import 'package:flutter/material.dart';
import 'dart:ui';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
 final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  
 var wtController = TextEditingController();
 var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor=  Colors.purple;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Your BMI'),
        backgroundColor: Colors.blueAccent,
      ),
      body:Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('BMI', style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
          
              SizedBox(height: 20,),
          
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your weight'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
          
              SizedBox(height: 20,),
              
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text('Enter your height in feet'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              
              SizedBox(height: 20,),
          
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text('Enter your height in inch'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
          
              SizedBox(height: 20,),
          
              ElevatedButton(
                onPressed: (){
               
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();
                  
                if(wt!="" && ft!="" && inch!=""){
                  
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iInch = int.parse(inch);
                  
                  var tInch = (ift*12) + iInch;
                  
                  var tCm = tInch*(2.54);
                  
                  var tM = tCm/100;
              
                  var hMe = tM*tM;
                  
                  var bmi = iwt/hMe;
              
                  var msg = "";
              
                  if(bmi>25){
                    msg = "You are OverWeight!!";
                    bgColor = Colors.orange;
                  } else if(bmi<18){
                    msg = "You are UnderWeight!!";
                    bgColor = Colors.yellow;
              
                  }else {
                    msg = "You are Healthy!!";
                    bgColor = Colors.green;
              
                  }
                  
                  setState(() {
                    result = "$msg  Your BMI is : ${bmi.toStringAsFixed(4)}";
              
                  });
                  
                  
                  
                }  else  {
                  setState(() {
                    result = "Please fill all the required blanks!!";
                  });
                  
                }
              }, child: Text('Calculate')
              
              ),
      
              SizedBox(height: 20,),
      
              Text(result, style: TextStyle(fontSize: 20),),
            ],),
          ),
        ),
      )
        );
  }
}
