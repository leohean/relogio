import 'package:flutter/material.dart';
import 'package:relogio/model/relogio.dart';

class RelogioController{
  late Relogio relogio;

  RelogioController(){
    relogio=Relogio();
  }

  void maisHora(){
    relogio.maisHora();
  }

  void menosHora(){
    relogio.menosHora();
  }

  void maisMinuto(){
    relogio.maisMinuto();
  }

  void menosMinuto(){
    relogio.menosMinuto();
  }

  int getHora(){
    return relogio.getHora();
  }

  int getMinuto(){
    return relogio.getMinuto();
  }

  List<int> calculaTempoTotal(RelogioController relogioInicio, RelogioController relogioFim){
    List<int> list=[];
    int tempoTotal;
    if((relogioFim.getHora()*60+relogioFim.getMinuto())>=(relogioInicio.getHora()*60+relogioInicio.getMinuto())){
      tempoTotal=(relogioFim.getHora()*60+relogioFim.getMinuto())-(relogioInicio.getHora()*60+relogioInicio.getMinuto());
      list.add(tempoTotal~/60);
      list.add(tempoTotal%60);
    }
    else{
      tempoTotal=(relogioFim.getHora()*60+relogioFim.getMinuto())+(1440-(relogioInicio.getHora()*60+relogioInicio.getMinuto()));
      list.add((tempoTotal~/60));
      list.add(tempoTotal%60);
    }
    return list;
  }

  Widget mostraTempoTotal(RelogioController relogioInicio, RelogioController relogioFim){
    List<int> tempoTotal=[0,0];
    tempoTotal=calculaTempoTotal(relogioInicio, relogioFim);

    if(tempoTotal[1]<10){
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text(
            style: TextStyle(fontSize:30),
            "Tempo: "+tempoTotal[0].toString()+"h 0"+tempoTotal[1].toString()+"min"
          ),
        ],
      );
    }
    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
            Text(
              style: TextStyle(fontSize:30),
              "Tempo: "+tempoTotal[0].toString()+"h "+tempoTotal[1].toString()+"min"
            ),
        ],
      );
    }
  }
}