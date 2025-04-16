class Protocol {
  String name;
  String acronym;
  int port;
  String purpose;
  OSILayer operation;
  boolean expanded;
  Protocol[] subProtocols;
  ProtocolType type;



  Protocol(String n, String a, int p, String pp, OSILayer op) {
    this.name = n;
    this.acronym = a;
    this.port = p;
    this.purpose = pp;
    this.operation = op;
  }

  void Display() {
    noStroke();
    fill(51);
    textSize(20);
    textAlign(LEFT, CENTER);
    textBox(acronym, 140, 30, 60, 25, 2);
    textBox(name, 140, 70, 200, 25, 2);
    textBox("" + port, 140, 110, 40, 20, 2);
    textBox("OSI Layer : " + operation.name(), 420, 40, 140, 50, 2);
    textBox(purpose, 140, 145, 420, 400, 2);
  }

  public String ChooseCorrectLayer(OSILayer layer) {
    String r = "";
    switch(layer) {
    case PHYSICAL :
      r = "Physical Layer";
      break;
    case DATALINK :
      r = "Datalink";
      break;
    case NETWORK :
      r = "Network";
      break;
    case TRANSPORT :
      r = "Transport";
      break;
    case SESSION :
      r = "Session";
      break;
    case PRESENTATION :
      r = "Presentation";
      break;
    case APPLICATION :
      r = "Application" ;
      break;
    default :
      r = "Undefined";
      break;
    }
    return r;
  }


  void AddSubProtocol() {
  }
}


class ProtocolCreater{
  
  ProtocolCreater(){
    
  }
  
  
  void CreateProtocol (){
    
    
  }
  
  
  
}
