class Relogio{
  int _hora=12;
  int _minuto=0;

  void maisHora(){
    if(this._hora<23)
      this._hora++;
    else
      this._hora=0;
  }

  void menosHora(){
    if(this._hora>0)
      this._hora--;
    else
      this._hora=23;
  }

  void maisMinuto(){
    if(this._minuto<59)
      this._minuto++;
    else{
      this._minuto=0;
      maisHora();
    }
  }
  
  void menosMinuto(){
    if(this._minuto>0)
      this._minuto--;
    else{
      this._minuto=59;
      menosHora();
    }
  }

  int getHora(){
    return this._hora;
  }

  int getMinuto(){
    return this._minuto;
  }

}