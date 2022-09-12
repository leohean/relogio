import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relogio/controller/relogio_controller.dart';

class HomePage extends StatefulWidget{
  @override
  State createState(){
    return PageState();
  }
}

class PageState extends State{

  RelogioController relogioInicio=RelogioController();
  RelogioController relogioFim=RelogioController();

  Widget tempoTotal=Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          style: TextStyle(fontSize:30),
          "Tempo: 0h 00min"
        )
      ]
    );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions:[
          TextButton(
            onPressed: (){
              SystemNavigator.pop();
            },
            child: Text(
              style: TextStyle(color: Colors.black),
              "Sair")
          )
        ],
        title:Text("Calculadora de Tempo", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber[400],
        ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),

          Timer(relogioInicio),

          SizedBox(
            height: 50,
          ),

          Timer(relogioFim),

          SizedBox(
            height: 30,
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 60),
                    shape: CircleBorder(),
                    primary: Colors.amber[400]
              ),
            onPressed:(){
                tempoTotal=relogioFim.mostraTempoTotal(relogioInicio, relogioFim);
                setState(() {                    
              });
            },
            child: Text(
                  style: TextStyle(fontSize: 30),
                  "="
                )
          ),
          SizedBox(
            height: 30,
          ),
          
          tempoTotal
          
        ],
      ),
      
    );
  }
  
}

class Timer extends StatefulWidget{
  late RelogioController relogio;

  Timer(RelogioController relogio){
    this.relogio=relogio;
  }

  State createState(){
    return TimerState(relogio);
  }
}

class TimerState extends State{
  late RelogioController relogio;

  TimerState(RelogioController relogio){
    this.relogio=relogio;
  }

  Widget build(BuildContext context){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    style: TextStyle(fontSize: 30),
                    "Começo: "
                  )
                ]
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.green
                    ),
                    onPressed:(){
                      relogio.maisHora();
                      setState(() { 
                      });
                    },
                    child: Icon(Icons.add)
                  ),
                  Text(
                    style: TextStyle(fontSize:30),
                    relogio.getHora().toString()+"h "
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.red
                    ),
                    onPressed:(){
                      relogio.menosHora();
                      setState(() {        
                      });
                    },
                    child: Icon(Icons.remove),)
                ]
                ,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.green
                    ),
                    onPressed:(){
                      relogio.maisMinuto();
                      setState(() {  
                      });
                    },
                    child: Icon(Icons.add)
                  ),
                  Text(
                    style: TextStyle(fontSize:30),
                    relogio.getMinuto().toString()+"min"
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.red
                    ),
                    onPressed:(){
                      relogio.menosMinuto();
                      setState(() { 
                      });
                    },
                    child: Icon(Icons.remove)
                  ),
                ],
              )
            ],
          );
  }
  
}



