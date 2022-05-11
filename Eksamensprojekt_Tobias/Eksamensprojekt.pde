// Gør plads til forskellige variabler, og giver dem værdier
boolean slut=false, powerupcheck=false, powerup1=false, powerup2=false, cd1=false, cd2=false,
  match1=false, match2=false, tur1=false, tur2=false, startskærm=true, spil=false, spil1=false,
  spil2=false;
String start="Start", regler="Målet med spillet",
  welcome2=" Hver tur slår begge spillere en terning. \n"+
  "Den der slår lavest mister et liv.\n\n Du skal reducere din modstanders liv til 0\n"+
  " for at vinde. Taberen skal bunde deres genstand.\n\n "+
  "Hvis man spiller på hold, skal holdet i alt drikke\n det antal slurke spillet viser,"+
  "ganget med antal\n personer på holdet.\n\n Hvis Hans spiller dette spil skal han\n"+
  "drikke dobbelt så meget",
  powerups="I spillet er der forskellige power-ups man kan bruge:";
PImage øllebajer, terning, terning2, side1, side2, side3, side4, side5, side6, power1, power1m, power2, power2m;
int tur=0, starth=250, startb=500, rectb, recth=height, kast, kast2, kastpower1, kastpower2, kastpower12, kastpower22, liv1=10, liv2=10;
PFont intro;



void setup() {
  // Sætter programmet til at fylde hele skærmen, og initialiserer alle filer som jeg skal bruge i mit program
  fullScreen();
  øllebajer=loadImage("øl2.png");
  terning=loadImage("Terning.png");
  terning2=loadImage("Terning2.png");
  side1=loadImage("side1.png");
  side2=loadImage("side2.png");
  side3=loadImage("side3.png");
  side4=loadImage("side4.png");
  side5=loadImage("side5.png");
  side6=loadImage("side6.png");
  power1=loadImage("power1.png");
  power1m=loadImage("power1m.png");
  power2=loadImage("power2.png");
  power2m=loadImage("power2m.png");

  intro=createFont("intro.ttf", 50);
  textFont(intro);
}


void draw() {

  if (startskærm==true)
  {
    //Opsætter startmenuen
    background(øllebajer);
    fill(0);


    textAlign(CENTER, CENTER);
    imageMode(CENTER);
    fill(#C9A672);
    rectMode(CORNER);
    rect(100, 100, width-200, height-200);
    fill(#906830);
    rectMode(CENTER);
    rect(width/2, height/2, 20, height-250);
    rectMode(CORNER);
    fill(#30A55A);
    rect(width-400, height-250, 275, 125);


    textSize(60);
    fill(#58401E);
    text(regler, width/4+50, 150);
    text("Power-Ups", width*3/4-25, 150);

    text(start, width-265, height-195);
    textSize(35);
    text(welcome2, width/4+50, height/2);

    imageMode(CENTER);
    rectMode(CENTER);
    strokeWeight(3);
    rect(width/2+150, 400, 200, 200);
    rect(width/2+150, 700, 200, 200);
    image(power1, width/2+150, 400, 200, 200);
    text("Denne Power-up gør at\nman kan slå med 2\nterninger i stedet for 1.\nKan kun bruges hver 3. tur", width/2+520, 390);
    image(power2, width/2+150, 700, 200, 200);
    text("Denne Power-up gør at\nman heler 1 liv\nmen man der trækkes 2\n fra det man slår", width/2+520, 690);
    rectMode(CORNER);
  } else if (spil==true) {

    rectMode(CENTER);

    if (tur>3) {
      cd1=false;
    }

    if (cd1==false) {
      rect(200, height/2+50, 200, 200);
      image(power1, 200, height/2+50, 200, 200);
    } else if (cd1==true) {
      rect(200, height/2+50, 200, 200);
      image(power1m, 200, height/2+50, 200, 200);
    }
    if (cd2==false) {
      rect(200, height/2-200, 200, 200);
      image(power2, 200, height/2-200, 200, 200);
    } else if (cd2==true) {
      rect(200, height/2-200, 200, 200);
      image(power2m, 200, height/2-200, 200, 200);
    }

    terning1();
    terning2();
    textAlign(CENTER, CENTER);

    rectMode(CENTER);
    fill(#C9A672);
    rect(width-200, 100, 400, 200);
    rect(200, 100, 400, 200);
    fill(#E34C4C);
    textSize(100);
    text(liv1, 200, 100);
    text(liv2, width-200, 100);
    fill(#58401E); //farver liv rødt
  }

  if (liv1==0) {
    slut=true;
    spil=false;
    background(øllebajer);


    fill(#C9A672);
    rectMode(CORNER);
    rect(100, 100, width-200, height-200);

    textAlign(CENTER, CENTER);
    fill(0);
    textSize(200);
    text("SPILLER 2 VINDER", width/2, height/4);
    textSize(100);
    text("Så er det tid for taberen at drikke\nSKÅL", width/2, height/2);



    textSize(100);
    fill(0);


    rectMode(CENTER);
    fill(#30A55A);
    rect(width/3, height*3/4, 500, 200);
    rect(width*2/3, height*3/4, 500, 200);

    textSize(70);
    fill(0);
    text("Restart", width/3, height*3/4);
    text("Quit", width*2/3, height*3/4);
  } else if (liv2==0) {
    slut=true;
    spil=false;
    background(øllebajer);


    fill(#C9A672);
    rectMode(CORNER);
    rect(100, 100, width-200, height-200);

    textAlign(CENTER, CENTER);
    fill(0);
    textSize(200);
    text("SPILLER 1 VINDER", width/2, height/4);
    textSize(100);
    text("Så er det tid for taberen at drikke\nSKÅL", width/2, height/2);



    textSize(100);
    fill(0);


    rectMode(CENTER);
    fill(#30A55A);
    rect(width/3, height*3/4, 500, 200);
    rect(width*2/3, height*3/4, 500, 200);

    textSize(70);
    fill(0);
    text("Restart", width/3, height*3/4);
    text("Quit", width*2/3, height*3/4);
  }
}


void keyPressed() {
  if (spil==true) {
    if (key=='w'&&cd1==false) {
      powerup1=true;
      cd1=true;
      tur=0;
    }
    if (key=='q'&&spil1==false&&powerup1==false) {

      rectMode(CORNER);
      fill(#C9A672);

      strokeWeight(0);
      rect(400, 0, width/4+75, height-300);
      fill(#58401E);
      kast=int(random(1, 6));
      terningekast();
      rectMode(CENTER);

      spil1=true;
      match1=true;
    } else if (key=='q'&&spil1==false&&powerup1==true) {
      rectMode(CORNER);
      fill(#C9A672);

      strokeWeight(0);
      rect(400, 0, width/4+75, height-300);
      fill(#58401E);
      kastpower1=int(random(2, 12));
      terningekastpower1();


      spil1=true;
      match1=true;
    } else if (key=='p'&&spil2==false) {

      rectMode(CORNER);
      fill(#C9A672);


      rect(width/2, 0, width/4+75, height-300);
      fill(#58401E);
      kast2=int(random(1, 6));
      terningekast2();

      spil2=true;
      match2=true;
    }
    if (match1&&match2==true) {

      if (kast>kast2||kastpower1>kast2||kastpower1>kastpower12||kastpower2>kast2||kastpower2>kastpower12||kastpower2>kastpower22) {
        liv2-=1;
        kast=0;
        kast2=0;
        kastpower1=0;
        kastpower2=0;
        kastpower12=0;
        kastpower22=0;
      } else if (kast2>kast||kast2>kastpower1/*||kastpower12>kastpower1||kast2>kastpower2||kastpower12>kastpower2||kastpower22>kastpower2*/) {
        liv1-=1;
        kast=0;
        kast2=0;
        kastpower1=0;
        kastpower2=0;
        kastpower12=0;
        kastpower22=0;
      } else if (kast2==kast||kast2==kastpower1||kastpower12==kastpower1||kast2==kastpower2||kastpower12==kastpower2||kastpower22==kastpower2) {
      }
      fill(#58401E);
      match1=false;
      match2=false;
      spil1=false;
      spil2=false;
      powerup1=false;

      tur+=1;
    }
  }
}


void mousePressed() {
  if (startskærm==true&&mouseX>=width-400&&mouseX<=width-400+275&&mouseY>=height-250&&mouseY<=height-250+125 ) {
    startskærm=false;
    spil=true;
    background(#C9A672);

    //rect(0, 0, 400, height);
    text("Tryk q for at slå", 200, height-350);
    text("Tryk p for at slå", width-200, height-350);
    line(400, height, 400, 0);
    line(width-400, height, width-400, 0);
    line(0, height-300, width, height-300);
  }
  if (slut==true) {
    if (mouseX>width*2/3-250&&mouseX<width*2/3+250&&mouseY>height*3/4-100&&mouseY<height*3/4+100) {
      exit();
    } else if (mouseX>width/3-250&&mouseX<width/3+250&&mouseY>height*3/4-100&&mouseY<height*3/4+100) {
      liv1=10;
      liv2=10;
      slut=false;
      powerupcheck=false;
      powerup1=false;
      powerup2=false;
      cd1=false; 
      cd2=false; 
      match1=false;
      match2=false;
      tur1=false; 
      tur2=false; 
      startskærm=true; 
      spil=false;
      spil1=false;
      spil2=false;
    }
  }
}
//rect(width/3, height*3/4, 500, 200);
//rect(width*2/3, height*3/4, 500, 200);


void terning1()
{
  if (spil1==false) {
    imageMode(CENTER);

    image(terning, 200, height-150, 400, 300);
  } else if (spil1==true) {
    image(terning2, 200, height-150, 400, 300);
  }
}
void terning2()
{
  if (spil2==false) {
    imageMode(CENTER);

    image(terning, width-200, height-150, 400, 300);
  } else if (spil2==true) {
    image(terning2, width-200, height-150, 400, 300);
  }
}

void terningekast() {
  imageMode(CENTER);
  if (kast==1) {
    image(side1, width/3, height/2, 500, 300);
  } else if (kast==2) {
    image(side2, width/3, height/2, 500, 300);
  } else if (kast==3) {
    image(side3, width/3, height/2, 500, 300);
  } else if (kast==4) {
    image(side4, width/3, height/2, 500, 300);
  } else if (kast==5) {
    image(side5, width/3, height/2, 500, 300);
  } else if (kast==6) {
    image(side6, width/3, height/2, 500, 300);
  }
}
void terningekastpower1() {
  imageMode(CENTER);
  if (kastpower1==2) {
    image(side1, width/3, height/2, 500, 300);
    image(side1, width/3, height/3, 500, 300);
  } else if (kastpower1==3) {
    image(side2, width/3, height/2, 500, 300);
    image(side1, width/3, height/3, 500, 300);
  } else if (kastpower1==4) {
    image(side2, width/3, height/2, 500, 300);
    image(side2, width/3, height/3, 500, 300);
  } else if (kastpower1==5) {
    image(side3, width/3, height/2, 500, 300);
    image(side2, width/3, height/3, 500, 300);
  } else if (kastpower1==6) {
    image(side5, width/3, height/2, 500, 300);
    image(side1, width/3, height/3, 500, 300);
  } else if (kastpower1==7) {
    image(side6, width/3, height/2, 500, 300);
    image(side1, width/3, height/3, 500, 300);
  } else if (kastpower1==8) {
    image(side6, width/3, height/2, 500, 300);
    image(side2, width/3, height/3, 500, 300);
  } else if (kastpower1==9) {
    image(side6, width/3, height/2, 500, 300);
    image(side3, width/3, height/3, 500, 300);
  } else if (kastpower1==10) {
    image(side6, width/3, height/2, 500, 300);
    image(side4, width/3, height/3, 500, 300);
  } else if (kastpower1==11) {
    image(side6, width/3, height/2, 500, 300);
    image(side5, width/3, height/3, 500, 300);
  } else if (kastpower1==12) {
    image(side6, width/3, height/2, 500, 300);
    image(side6, width/3, height/3, 500, 300);
  }
}

void terningekast2() {
  imageMode(CENTER);
  if (kast2==1) {
    image(side1, width*2/3, height/2, 500, 300);
  } else if (kast2==2) {
    image(side2, width*2/3, height/2, 500, 300);
  } else if (kast2==3) {
    image(side3, width*2/3, height/2, 500, 300);
  } else if (kast2==4) {
    image(side4, width*2/3, height/2, 500, 300);
  } else if (kast2==5) {
    image(side5, width*2/3, height/2, 500, 300);
  } else if (kast2==6) {
    image(side6, width*2/3, height/2, 500, 300);
  }
}
