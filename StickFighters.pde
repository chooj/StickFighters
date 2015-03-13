float userX = 0;
float userY = 0;
float headX = userX + 240;
float headY = userY + 215;
float armPointY = userY + 310;
float armPointX1 = userX + 300;
float armPointY1 = userY + 330;
float armPointX2 = userX + 350;
float armPointY2 = userY + 210;
float thighPointY1 = userY + 475;
float thighPointX1 = userX + 260;
float thighPointY2 = userY + 475;
float thighPointX2 = userX + 265;
float thighPointY3 = userY + 565;
float bodyPointY = userY + 260;
float bodyPointX = userX + 215;
float thighMove = 1;
float duckTime = -400;
float punchTime = -350;
float kickTime = -300;
float userHP = 100;
float x = -10;
boolean jumping;
boolean walking;
boolean ducking;
boolean punching;
boolean kicking;
boolean right;
boolean left;

float enemyX = 0;
float enemyY = 0;
float EheadX = enemyX + 560;
float EheadY = enemyY + 215;
float EarmPointY = enemyY + 310;
float EarmPointX1 = enemyX + 500;
float EarmPointY1 = enemyY + 330;
float EarmPointX2 = enemyX + 450;
float EarmPointY2 = enemyY + 210;
float EthighPointY1 = enemyY + 475;
float EthighPointX1 = enemyX + 540;
float EthighPointY2 = enemyY + 475;
float EthighPointX2 = enemyX + 535;
float EthighPointY3 = enemyY + 565;
float EbodyPointY = enemyY + 260;
float EbodyPointX = enemyX + 585;
float EthighMove = 1;
float EjumpTime = -699;
float enemyHP = 100;
float Ex = -10;
float EhitProb = 25;
float EduckProb = random(100);
float EjumpProb = random(100);
float EactionProb = random(1);
float Etimer = 0;
float Etiming = 500;
boolean Ejumping = false;
boolean Ewalking = false;
boolean Educking = false;
boolean Epunching = false;
boolean Ekicking = false;
color Efill = color(0, 0, 255);

float warningTime = 50;
int userHPdisplay = round(userHP);
int enemyHPdisplay = round(enemyHP);
int level = 1;
color openingFill = color(0, 0, 255);
boolean opening = true;
boolean alive = true;
boolean paused = false;
PFont font = createFont("AmericanTypewriter-Condensed", 92);

void duck() {
  headY = 255;
  armPointY = 325;
  bodyPointY = 300;
}

void walk() {
  thighPointY1 = thighPointY1 + 2 * thighMove;
  thighPointY2 = thighPointY2 - 2 * thighMove;
  thighPointY3 = thighPointY1 + 90;
  if (thighPointY1 > 478) {
    thighMove = -1;
  }
  if (thighPointY1 < 472) {
    thighMove = 1;
  }
}

void punch() {
  armPointX1 = userX + 310;
  armPointY1 = armPointY;
  armPointX2 = userX + 450;
  armPointY2 = armPointY;
}

void kick() {
  thighPointX1 = userX + 310;
  thighPointY1 = userY + 400;
  thighPointX2 = userX + 430;
  thighPointY3 = userY + 410;
}



void Educk() {
  EheadY = 255;
  EarmPointY = 325;
  EbodyPointY = 300;
}

void Ewalk() {
  EthighPointY1 = EthighPointY1 + 3 * EthighMove;
  EthighPointY2 = EthighPointY2 - 3 * EthighMove;
  EthighPointY3 = EthighPointY1 + 90;
  if (EthighPointY1 > 477) {
    EthighMove = -1;
  }
  if (EthighPointY1 < 473) {
    EthighMove = 1;
  }
}

void Epunch() {
  EarmPointX1 = enemyX + 490;
  EarmPointY1 = EarmPointY;
  EarmPointX2 = enemyX + 350;
  EarmPointY2 = EarmPointY;
}

void Ekick() {
  EthighPointX1 = enemyX + 490;
  EthighPointY1 = enemyY + 400;
  EthighPointX2 = enemyX + 370;
  EthighPointY3 = enemyY + 410;
}

void Ejump() {
  Ejumping = true;
  enemyY = (Ex*Ex) - 100;
  Ex = Ex + 0.5;
}


void win() {
  filter(BLUR);
  textFont(font, 120);
  fill(0, 0, 0);
  text("YOU", 250, 280);
  text("WIN", 250, 390);
  alive = true;
}

void death() {
  filter(BLUR);
  textFont(font, 120);
  fill(0, 0, 0);
  text("YOU", 250, 280);
  text("DIED", 250, 390);
  alive = false;
}

void pause() {
  filter(BLUR);
  textFont(font, 120);
  fill(0, 0, 0);
  text("PAUSED", 140, 350);
}


void reset() {
  userX = 0;
  userY = 0;
  headX = userX + 240;
  headY = userY + 215;
  duckTime = -400;
  armPointY = userY + 310;
  armPointX1 = userX + 300;
  armPointY1 = userY + 330;
  armPointX2 = userX + 350;
  armPointY2 = userY + 210;
  punchTime = -350;
  thighPointY1 = userY + 475;
  thighPointX1 = userX + 260;
  thighPointY2 = userY + 475;
  thighPointX2 = userX + 265;
  thighPointY3 = userY + 565;
  thighMove = 1;
  kickTime = -300;
  bodyPointY = userY + 260;
  bodyPointX = userX + 215;
  userHP = 100;
  x = -10;

  enemyX = 0;
  enemyY = 0;
  EheadX = enemyX + 560;
  EheadY = enemyY + 215;
  EarmPointY = enemyY + 310;
  EarmPointX1 = enemyX + 500;
  EarmPointY1 = enemyY + 330;
  EarmPointX2 = enemyX + 450;
  EarmPointY2 = enemyY + 210;
  EthighPointY1 = enemyY + 475;
  EthighPointX1 = enemyX + 540;
  EthighPointY2 = enemyY + 475;
  EthighPointX2 = enemyX + 535;
  EthighPointY3 = enemyY + 565;
  EbodyPointY = enemyY + 260;
  EbodyPointX = enemyX + 585;
  EthighMove = 1;
  enemyHP = 100;
  Ex = -10;
  Ejumping = false;
  Ewalking = false;
  Educking = false;
  Epunching = false;
  Ekicking = false;
  EduckProb = random(100);
  EduckProb = random(100);
  EjumpProb = random(100);
  EactionProb = random(1);
  Etimer = 0;

  openingFill = color(0, 0, 255);
  alive = true;
  opening = true;
}

void setup() {
  size(800, 600);
}

void draw() {
  background(255, 255, 255);
  smooth();

  // opening
  if (opening == true) {
    noStroke();
    fill(openingFill);
    rect(230, 200, 355, 190);
    textFont(font);
    fill(0, 0, 0);
    text("START", 250, 325);
    textSize(70);
    text("LEVEL" + level, 270, 180);
    if (mouseX > 230 && mouseX < 585 && mouseY > 200 && mouseY < 390) {
      openingFill = color(100, 100, 255);
    } else {
      openingFill = color(0, 0, 255);
    }
  }

  if (opening == false) {
    strokeWeight(7.5);
    stroke(0, 0, 0);

    // ground
    noStroke();
    fill(#BF9E43);
    rect(0, 575, 800, 25);
    stroke(0, 0, 0);
    strokeWeight(10);
    line(0, 575, 800, 575);
    strokeWeight(7.5);

    // hp
    userHPdisplay = round(userHP);
    enemyHPdisplay = round(enemyHP);
    // USERhp
    fill(0, 0, 0);
    textSize(25);
    text(userHPdisplay, 339 - (userHP*3), 63);
    fill(255, 0, 0);
    strokeWeight(5);
    rect(400 - (userHP*3), 40, userHP*3, 30);
    fill(255, 255, 255);
    noStroke();
    rect((400 - (userHP*3)) - 2.5, 43, 5.5, 25);
    //ENEMYhp
    fill(0, 0, 0);
    textSize(25);
    text(enemyHPdisplay, enemyHP*3 + 412, 63);
    fill(Efill);
    strokeWeight(5);
    stroke(0, 0, 0);
    rect(400, 40, enemyHP*3, 30);
    fill(255, 255, 255);
    noStroke();
    rect(enemyHP*3 + 398, 43, 5, 25);

    // USER
    // person
    fill(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(7.5);
    ellipse(userX + 240, headY, 100, 100);
    line(bodyPointX, bodyPointY, bodyPointX, userY + 400);

    // legs
    line(userX + 215, userY + 400, thighPointX1, thighPointY1);
    line(userX + 215, userY + 400, userX + 195, thighPointY2);
    line(thighPointX1, thighPointY1, thighPointX2, thighPointY3);
    line(userX + 195, thighPointY2, userX + 190, thighPointY2 + 90);

    // arms
    line(userX + 220, armPointY, armPointX1, armPointY1);
    line(userX + 220, armPointY, userX + 300, userY + 330);
    line(armPointX1, armPointY1, armPointX2, armPointY2);
    line(userX + 300, userY + 330, userX + 350, userY + 210);

    // joints
    fill(255, 0, 0);
    noStroke();
    ellipse(armPointX1, armPointY1, 20, 20);
    ellipse(userX + 300, userY + 330, 20, 20);
    ellipse(armPointX2, armPointY2, 20, 20);
    ellipse(userX + 350, userY + 210, 20, 20);
    ellipse(bodyPointX + 1.5, userY + 400, 20, 20);
    ellipse(thighPointX1, thighPointY1, 20, 20);
    ellipse(userX + 195, thighPointY2, 20, 20);
    stroke(0, 0, 0);

    // actions
    if (alive == true && enemyHP > 0 && paused == false) {
      // jumping
      if (jumping == true) {
        if (millis() - kickTime > 250 && ducking == false) {
          userY = (x*x) - 100;
          x = x + 0.5;
        }
      }
      if (x > 10) {
        x = -10;
      }
      if (x == -10) {
        jumping = false;
      }
      // ducking
      if (millis() - duckTime <= 400) {
        ducking = true;
        duck();
      }
      // walking
      walking = false;
      left = false;
      right = false;
      if (keyPressed) {
        if (kicking == false) {
          if (keyCode == LEFT && millis() - punchTime > 350 && userX + 170 > 0) {
            if (x == -10) {
              userX = userX - 3;
              left = true;
              walking = true;
              walk();
            }
          }
          if (keyCode == RIGHT && millis() - punchTime > 350 && userX + 600 < 800) {
            if (x == -10) {
              userX = userX + 3;
              right = true;
              walking = true;
              walk();
            }
          }
        }
      }
      //punching
      if (millis() - punchTime <= 350) {
        if (kicking == false) {
          punch();
          punching = true;
        }
      }
      // kicking
      if (millis() - kickTime > 0 && millis() - kickTime <= 300) {
        kick();
        kicking = true;
      }
      if (millis() - kickTime > 300) {
        kicking = false;
      }

      // is variable
      bodyPointX = userX + 215;
      if (millis() - punchTime > 300) {
        punching = false;
        armPointX1 = userX + 300;
        armPointY1 = userY + 330;
        armPointX2 = userX + 350;
        armPointY2 = userY + 210;
      }
      if (walking == false && kicking == false) {
        thighPointY1 = userY + 475;
        thighPointY2 = userY + 475;
        thighPointY3 = userY + 565;
      }
      if (kicking == false) {
        thighPointX1 = userX + 260;
        thighPointX2 = userX + 265;
      }
      if (millis() - duckTime > 400) {
        ducking = false;
        bodyPointY = userY + 260;
        headY = userY + 215;
        armPointY = userY + 310;
      }
    }



    // ENEMY
    // person
    fill(255, 255, 255);
    strokeWeight(7.5);
    stroke(0, 0, 0);
    ellipse(enemyX + 560, EheadY, 100, 100);
    line(EbodyPointX, EbodyPointY, EbodyPointX, enemyY + 400);

    // legs
    line(enemyX + 585, enemyY + 400, EthighPointX1, EthighPointY1);
    line(enemyX + 585, enemyY + 400, enemyX + 605, EthighPointY2);
    line(EthighPointX1, EthighPointY1, EthighPointX2, EthighPointY3);
    line(enemyX + 605, EthighPointY2, enemyX + 610, EthighPointY2 + 90);

    // arms
    line(enemyX + 580, EarmPointY, EarmPointX1, EarmPointY1);
    line(enemyX + 580, EarmPointY, enemyX + 500, enemyY + 330);
    line(EarmPointX1, EarmPointY1, EarmPointX2, EarmPointY2);
    line(enemyX + 500, enemyY + 330, enemyX + 450, enemyY + 210);

    // joints
    if (level == 1) {
      Efill = color(0, 0, 255);
    }
    if (level == 2) {
      Efill = color(0, 255, 0);
    }
    if (level == 3) {
      Efill = color(255, 255, 0);
    }
    if (level == 4) {
      Efill = color(0, 255, 255);
    }
    if (level == 5) {
      Efill = color(random(255), random(255), random(255));
    }
    fill(Efill);
    noStroke();
    ellipse(EarmPointX1, EarmPointY1, 20, 20);
    ellipse(enemyX + 500, enemyY + 330, 20, 20);
    ellipse(EarmPointX2, EarmPointY2, 20, 20);
    ellipse(enemyX + 450, enemyY + 210, 20, 20);
    ellipse(EbodyPointX - 1.5, enemyY + 400, 20, 20);
    ellipse(EthighPointX1, EthighPointY1, 20, 20);
    ellipse(enemyX + 605, EthighPointY2, 20, 20);
    stroke(0, 0, 0);

    // is variables
    Ejumping = false;
    Ewalking = false;
    Educking = false;
    Epunching = false;
    Ekicking = false;
    EbodyPointX = enemyX + 585;
    if (enemyY < 0 && Ex > 10.345) {
      Ex = -10;
      enemyY = 0;
    }
    if (Ex == -10) {
      Ejumping = false;
    }
    if (punching == false) {
      EduckProb = random(100);
    }
    if (kicking == false) {
      EjumpProb = random(100);
    }
    if (Epunching == false) {
      EarmPointX1 = enemyX + 500;
      EarmPointY1 = enemyY + 330;
      EarmPointX2 = enemyX + 450;
      EarmPointY2 = enemyY + 210;
    }
    if (Ewalking == false && Ekicking == false) {
      EthighPointY1 = enemyY + 475;
      EthighPointY2 = enemyY + 475;
      EthighPointY3 = enemyY + 565;
    }
    if (Ekicking == false) {
      EthighPointX1 = enemyX + 540;
      EthighPointX2 = enemyX + 535;
    }
    if (Educking == false) {
      EbodyPointY = enemyY + 260;
      EheadY = enemyY + 215;
      EarmPointY = enemyY + 310;
    }

    // Eactions
    if (alive == true && enemyHP > 0 && paused == false) {
      // walking
      if (walking == true) {
        if (left == true && userX > enemyX + 50 && userX < enemyX + 85) {
          enemyX = enemyX - 3;
          Ewalk();
          Ewalking = true;
        }
        if (right == true && userX > enemyX + 85) {
          enemyX = enemyX + 3;
          Ewalk();
          Ewalking = true;
        }
      }
      // choosing
      Etimer = Etimer + 1;
      if (Etimer > Etiming + 50) {
        Etimer = 0;
      }
      if (Etimer == Etiming - warningTime) {
        EactionProb = random(1);
      }
      // warning!
      if (Etimer > Etiming - warningTime && Etimer < Etiming - 1) {
        if (EactionProb < 0.5) {
          textSize(50);
          fill(255, 0, 0);
          text("!", EthighPointX2 - 30, EthighPointY2 + 60);
        }
        if (EactionProb >= 0.5) {
          textSize(50);
          fill(255, 0, 0);
          text("!", EarmPointX1 - 30, EarmPointY1 + 10);
        }
      }
      if (Etimer > Etiming && Etimer <= Etiming + 50) {
        if (EactionProb < 0.5) {
          Ekicking = true;
        }
        if (EactionProb >= 0.5) {
          Epunching = true;
        }
      }
      if (Ekicking == true) {
        Ekick();
      }
      if (Epunching == true) {
        Epunch();
      }

      // userHP
      if (Epunching == true && ducking == false && userX > enemyX + 50) {
        userHP = userHP - 0.5;
      }
      if (Ekicking == true && jumping == false && userX > enemyX + 50) {
        userHP = userHP - 0.5;
      }

      // Eblocks
      if (Ex > -10) {
        Ejumping = true;
        Ejump();
        Ex += 0.05;
      }
      if (kicking == true && x == -10 && enemyY == 0 && EjumpProb < 25 && Ejumping == false && userX > enemyX + 50) {
        enemyHP = enemyHP - 0.5;
      }
      if (punching == true && Ejumping == false && userX > enemyX + 50) {
        if (EduckProb >= EhitProb) {
          Educking = true;
          Educk();
        }
        if (EduckProb < EhitProb && enemyHP > 0) {
          enemyHP = enemyHP - 0.5;
        }
      }
      if (punching == true && millis() - EjumpTime <= 200) {
        enemyHP = enemyHP - 0.5;
      }
    }

    // winning/losing/pausing
    if (enemyHP == 0) {
      win();
    }
    if (userHP == 0) {
      death();
    }
    if (paused == true) {
      pause();
    }
  }
}

void mouseReleased() {
  if (opening == true) {
    if (mouseX > 230 && mouseX < 585 && mouseY > 200 && mouseY < 390) {
      opening = false;
    }
  }
}

void keyPressed() {
  if (opening == true) {
    if ((key == 's')||(keyCode == ENTER)||(key == ' ')) {
      opening = false;
    }
  }
  if (opening == false) {
    if (key == 'p') {
      if (paused == true) {
        paused = false;
      } else {
        paused = true;
      }
    }
    if (key == ' ' && punching == false) {
      punchTime = millis();
    }
    if (key == 'x' && punching == false && jumping == false && kicking == false) {
      kickTime = millis();
      if (EjumpProb >= EhitProb && userX > enemyX + 50 && Ejumping == false) {
        Ex = Ex + 0.0001;
      }
    }
    if (keyCode == DOWN && jumping == false) {
      duckTime = millis();
    }
    if (keyCode == UP) {
      jumping = true;
    }
  }
  if (enemyHP == 0 && key == ' ') {
    reset();
    level = level + 1;
    EhitProb = EhitProb - 5;
    Etiming = Etiming - 5;
    warningTime = warningTime - 5;
  }
  if (alive == false && key == ' ') {
    reset();
    EhitProb = 25;
    Etiming = 500;
    warningTime = 50;
  }
}
