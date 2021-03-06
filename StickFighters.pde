// user
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
color userFill = color(255, 0, 0);

// enemy
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

// shop
int coins = 0;
float userFillX = 150;
float colorY = 10;
color redSkin = color(255, 0, 0);
color blueSkin = color(0, 0, 255);
color greenSkin = color(0, 255, 0);
color yellowSkin = color(255, 255, 0);
color blue2Skin = color(0, 255, 255);
color randomSkin = color(random(255), random(255), random(255));
boolean hasRed = true;
boolean hasBlue = false;
boolean hasGreen = false;
boolean hasYellow = false;
boolean hasBlue2 = false;
boolean hasRandom = false;

// buttons and other stuff
int level = 1;
int userHPdisplay = round(userHP);
int enemyHPdisplay = round(enemyHP);
float optionX = 300;
float warningTime = 50;
color button1 = color(0, 0, 255);
color button2 = color(0, 0, 255);
color button3 = color(0, 0, 255);
PFont font = createFont("Avenir-Black", 92);

// booleans
boolean needsTutorial = true;
boolean inTutorial = false;
boolean inMenu = true;
boolean inShop = false;
boolean inOptions = false;
boolean inGame = false;
boolean randomFill = false;
boolean arrowKeys = true;
boolean wasd = false;
boolean opening = true;
boolean asking = false;
boolean paused = false;
boolean alive = true;

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
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 800, 600);
  stroke(0, 0, 0);
  textFont(font, 120);
  fill(0, 0, 0);
  text("YOU", 260, 200);
  text("WIN", 260, 310);
  fill(button1);
  rect(225, 350, 325, 70);
  fill(button2);
  rect(225, 455, 325, 70);
  fill(0, 0, 0);
  textSize(60);
  text("CONTINUE", 232, 408);
  text("MENU", 300, 513);
  if (mouseX > 225 && mouseX < 550 && mouseY > 350 && mouseY < 420) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
  if (mouseX > 225 && mouseX < 550 && mouseY > 465 && mouseY < 535) {
    button2 = color(100, 100, 255);
  } else {
    button2 = color(0, 0, 255);
  }
  alive = true;
}

void death() {
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 800, 600);
  stroke(0, 0, 0);
  textFont(font, 120);
  fill(0, 0, 0);
  text("YOU", 265, 200);
  text("DIED", 250, 310);
  fill(button1);
  rect(225, 350, 325, 70);
  fill(button2);
  rect(225, 455, 325, 70);
  fill(0, 0, 0);
  textSize(60);
  text("RESTART", 270, 408);
  text("MENU", 300, 513);
  if (mouseX > 225 && mouseX < 550 && mouseY > 350 && mouseY < 420) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
  if (mouseX > 225 && mouseX < 550 && mouseY > 465 && mouseY < 535) {
    button2 = color(100, 100, 255);
  } else {
    button2 = color(0, 0, 255);
  }
  alive = false;
}

void pause() {
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 800, 600);
  strokeWeight(7);
  stroke(0, 0, 0);
  textFont(font);
  fill(0, 0, 0);
  text("PAUSED", 210, 240);
  fill(button1);
  rect(225, 300, 325, 70);
  fill(button2);
  rect(225, 405, 325, 70);
  fill(0, 0, 0);
  textSize(70);
  text("RESUME", 250, 360);
  text("MENU", 290, 465);
  if (mouseX > 225 && mouseX < 550 && mouseY > 300 && mouseY < 370) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
  if (mouseX > 225 && mouseX < 550 && mouseY > 415 && mouseY < 485) {
    button2 = color(100, 100, 255);
  } else {
    button2 = color(0, 0, 255);
  }
}

void Open() {
  strokeWeight(7);
  fill(button1);
  rect(230, 220, 355, 190);
  textFont(font);
  fill(0, 0, 0);
  text("START", 270, 345);
  textSize(70);
  text("LEVEL" + level, 280, 180);
  if (mouseX > 230 && mouseX < 585 && mouseY > 220 && mouseY < 410) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
}

void menu() {
  inGame = false;
  fill(0, 0, 0);
  textFont(font);
  text("STICK", 275, 120);
  text("FIGHTERS", 175, 215);
  strokeWeight(7);
  fill(button1);
  rect(225, 270, 325, 70);
  fill(button2);
  rect(225, 365, 325, 70);
  fill(button3);
  rect(225, 460, 325, 70);
  fill(0, 0, 0);
  textSize(70);
  text("PLAY", 300, 330);
  text("SHOP", 300, 425);
  text("OPTIONS", 235, 520);
  if (mouseX > 225 && mouseX < 550 && mouseY > 270 && mouseY < 340) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
  if (mouseX > 225 && mouseX < 550 && mouseY > 365 && mouseY < 435) {
    button2 = color(100, 100, 255);
  } else {
    button2 = color(0, 0, 255);
  }
  if (mouseX > 225 && mouseX < 550 && mouseY > 460 && mouseY < 530) {
    button3 = color(100, 100, 255);
  } else {
    button3 = color(0, 0, 255);
  }
}

void shop() {
  inGame = false;
  inMenu = false;
  opening = false;
  randomSkin = color(random(255), random(255), random(255));
  background(255, 255, 255);
  noStroke();
  fill(redSkin);
  rect(100, colorY + 90, 120, 400);
  fill(blueSkin);
  rect(200, colorY + 90, 100, 400);
  fill(greenSkin);
  rect(300, colorY + 90, 100, 400);
  fill(yellowSkin);
  rect(400, colorY + 90, 100, 400);
  fill(blue2Skin);
  rect(500, colorY + 90, 100, 400);
  fill(randomSkin);
  rect(600, colorY + 90, 100, 400);
  fill(0, 0, 0);
  rect(100, colorY + 90, 600, 7);
  rect(100, colorY + 490, 607, 7);
  rect(100, colorY + 90, 7, 400);
  rect(200, colorY + 90, 7, 400);
  rect(300, colorY + 90, 7, 400);
  rect(400, colorY + 90, 7, 400);
  rect(500, colorY + 90, 7, 400);
  rect(600, colorY + 90, 7, 400);
  rect(700, colorY + 90, 7, 400);
  ellipse(userFillX, 540, 30, 30);
  strokeWeight(5);
  stroke(0, 0, 0);
  fill(button1);
  rect(40, 27, 125, 50);
  fill(0, 0, 0);
  textSize(35);
  text("BACK", 52, 63);
  if (mouseX > 40 && mouseX < 165 && mouseY > 27 && mouseY < 77) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
  textSize(40);
  text("COINS: " + coins, 500, 65);
  textSize(35);
  if (hasBlue == false) {
    text("100", 215, colorY + 540);
  }
  if (hasGreen == false) {
    text("100", 315, colorY + 540);
  }
  if (hasYellow == false) {
    text("150", 420, colorY + 540);
  }
  if (hasBlue2 == false) {
    text("150", 521, colorY + 540);
  }
  if (hasRandom == false) {
    text("200", 625, colorY + 540);
  }
  if (hasBlue == false) {
    if (inShop == true && coins < 100) {
      strokeWeight(4);
      stroke(150, 150, 150);
      noFill();
      ellipse(250, 290, 30, 30);
      fill(150, 150, 150);
      rect(232, 290, 36, 25);
      strokeWeight(7);
      stroke(0, 0, 0);
    }
    blueSkin = color(100, 100, 255);
  } else {
    blueSkin = color(0, 0, 255);
  }
  if (hasGreen == false) {
    if (inShop == true && coins < 100) {
      strokeWeight(4);
      stroke(150, 150, 150);
      noFill();
      ellipse(350, 290, 30, 30);
      fill(150, 150, 150);
      rect(332, 290, 36, 25);
      strokeWeight(7);
      stroke(0, 0, 0);
    }
    greenSkin = color(100, 255, 100);
  } else {
    greenSkin = color(0, 255, 0);
  }
  if (hasYellow == false) {
    if (inShop == true && coins < 100) {
      strokeWeight(4);
      stroke(150, 150, 150);
      noFill();
      ellipse(450, 290, 30, 30);
      fill(150, 150, 150);
      rect(432, 290, 36, 25);
      strokeWeight(7);
      stroke(0, 0, 0);
    }
    yellowSkin = color(255, 255, 100);
  } else {
    yellowSkin = color(255, 255, 0);
  }
  if (hasBlue2 == false) {
    if (inShop == true && coins < 150) {
      strokeWeight(4);
      stroke(150, 150, 150);
      noFill();
      ellipse(550, 290, 30, 30);
      fill(150, 150, 150);
      rect(532, 290, 36, 25);
      strokeWeight(7);
      stroke(0, 0, 0);
    }
    blue2Skin = color(100, 255, 255);
  } else {
    blue2Skin = color(0, 255, 255);
  }
  if (hasRandom == false) {
    if (inShop == true && coins < 150) {
      strokeWeight(4);
      stroke(150, 150, 150);
      noFill();
      ellipse(650, 290, 30, 30);
      fill(150, 150, 150);
      rect(632, 290, 36, 25);
      strokeWeight(7);
      stroke(0, 0, 0);
    }
  }
}

void options() {
  inGame = false;
  inMenu = false;
  opening = false;
  background(255, 255, 255);
  strokeWeight(5);
  fill(255, 255, 255);
  rect(150, 200, 80, 80);
  rect(50, 300, 80, 80);
  rect(150, 300, 80, 80);
  rect(250, 300, 80, 80);
  fill(0, 0, 0);
  textSize(60);
  triangle(170, 260, 190, 220, 210, 260);
  triangle(110, 320, 110, 360, 70, 340);
  triangle(170, 320, 190, 360, 210, 320);
  triangle(270, 320, 270, 360, 310, 340);
  fill(255, 255, 255);
  rect(550, 200, 80, 80);
  rect(450, 300, 80, 80);
  rect(550, 300, 80, 80);
  rect(650, 300, 80, 80);
  fill(0, 0, 0);
  text("W", 562, 260);
  text("A", 467, 360);
  text("S", 572, 360);
  text("D", 667, 360);
  fill(0, 0, 255);
  ellipse(300, 500, 100, 100);
  ellipse(500, 500, 100, 100);
  noStroke();
  fill(0, 0, 255);
  rect(300, 448, 200, 105);
  stroke(0, 0, 0);
  line(300, 450, 500, 450);
  line(300, 550, 500, 550);
  fill(255, 255, 255);
  ellipse(optionX, 500, 100, 100);
  fill(button1);
  rect(40, 27, 125, 50);
  fill(0, 0, 0);
  textSize(35);
  text("BACK", 52, 63);
  if (mouseX > 40 && mouseX < 165 && mouseY > 27 && mouseY < 77) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
}

void tutorial() {
  inGame = false;
  fill(255, 255, 255);
  noStroke();
  rect(0, 0, 800, 600);
  textSize(40);
  fill(0, 0, 0);
  text("PRESS SPACE TO PUNCH", 70, 80);
  text("PRESS 'X' TO KICK", 70, 135);
  if (arrowKeys == true && wasd == false) {
    text("PRESS UP TO JUMP", 70, 190);
    text("PRESS DOWN TO DUCK", 70, 245);
  }
  if (wasd == true && arrowKeys == false) {
    text("PRESS 'W' TO JUMP", 70, 190);
    text("PRESS 'S' TO DUCK", 70, 245);
  }
  stroke(0, 0, 0);
  strokeWeight(3);
  line(0, 300, 800, 300);
  text("CLICK OR PRESS 'P' TO PAUSE", 70, 370);
  text("DUCK TO BLOCK A PUNCH", 70, 425);
  text("JUMP TO BLOCK A KICK", 70, 480);
  text("'", 70, 535);
  fill(255, 0, 0);
  text("!", 80, 535);
  fill(0, 0, 0);
  text("'S ARE WARNINGS", 92, 535);
  noStroke();
  fill(button1);
  rect(525, 520, 240, 50);
  fill(0, 0, 0);
  rect(522, 517, 246, 6);
  rect(522, 567, 246, 6);
  rect(522, 517, 6, 56);
  rect(762, 517, 6, 56);
  stroke(0, 0, 0);
  text("CONTINUE", 540, 560);
  if (mouseX > 525 && mouseX < 765 && mouseY > 520 && mouseY < 570) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
}

void ask() {
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 800, 600);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  textSize(35);
  text("ARE YOU SURE YOU WANT", 185, 180);
  text("TO EXIT THE GAME?", 240, 230);
  text("ALL HP WILL BE RESET.", 220, 280);
  fill(button1);
  rect(100, 380, 200, 100);
  fill(button2);
  rect(500, 380, 200, 100);
  textSize(80);
  fill(0, 0, 0);
  text("YES", 130, 460);
  text("NO", 540, 460);
  if (mouseX > 100 && mouseX < 300 && mouseY > 380 && mouseY < 480) {
    button1 = color(100, 100, 255);
  } else {
    button1 = color(0, 0, 255);
  }
  if (mouseX > 500 && mouseX < 700 && mouseY > 380 && mouseY < 480) {
    button2 = color(100, 100, 255);
  } else {
    button2 = color(0, 0, 255);
  }
}

void afterWin() {
  if (level == 1) {
    coins = coins + 100 + round(userHP/3);
  }
  if (level == 2) {
    coins = coins + 150 + round(userHP/3);
  }
  if (level == 3) {
    coins = coins + 200 + round(userHP/3);
  }
  if (level == 4) {
    coins = coins + 250 + round(userHP/3);
  }
  if (level == 5) {
    coins = coins + 300 + round(userHP/3);
  }
  reset();
  level = level + 1;
  if (level != 5) {
    EhitProb = EhitProb - 5;
  }
  Etiming = Etiming - 5;
  warningTime = warningTime - 5;
}

void reset() {
  userX = 0;
  userY = 0;
  headX = userX + 240;
  headY = userY + 215;
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
  EjumpProb = random(100);
  EactionProb = random(1);
  Etimer = 0;
  redSkin = color(255, 0, 0);
  blueSkin = color(0, 0, 255);
  greenSkin = color(0, 255, 0);
  yellowSkin = color(255, 255, 0);
  blue2Skin = color(0, 255, 255);
  randomSkin = color(random(255), random(255), random(255));
  alive = true;
  opening = true;
}

void setup() {
  size(800, 600);
}

void draw() {
  background(255, 255, 255);
  smooth();

  // menu + shop + options + tutorial
  if (inTutorial == true && needsTutorial == true) {
    tutorial();
  }
  if (inMenu == true) {
    menu();
  }
  if (inShop == true) {
    shop();
  }
  if (inOptions == true) {
    options();
  }

  // gameplay
  if (inMenu == false) {
    // opening
    if (opening == true) {
      Open();
    }

    if (inGame == true) {
      strokeWeight(7);
      stroke(0, 0, 0);

      // ground
      noStroke();
      fill(#BF9E43);
      rect(0, 575, 800, 25);
      stroke(0, 0, 0);
      strokeWeight(10);
      line(0, 575, 800, 575);

      // hp
      userHPdisplay = round(userHP);
      enemyHPdisplay = round(enemyHP);
      // USERhp
      fill(0, 0, 0);
      textSize(25);
      text(userHPdisplay, 344 - (userHP*3), 60);
      fill(userFill);
      strokeWeight(5);
      rect(400 - (userHP*3), 42, userHP*3, 20);
      fill(255, 255, 255);
      noStroke();
      rect((400 - (userHP*3)) - 2.5, 45, 5.5, 15);
      //ENEMYhp
      fill(0, 0, 0);
      textSize(25);
      text(enemyHPdisplay, enemyHP*3 + 410, 60);
      fill(Efill);
      strokeWeight(5);
      stroke(0, 0, 0);
      rect(400, 42, enemyHP*3, 20);
      fill(255, 255, 255);
      noStroke();
      rect(enemyHP*3 + 398, 45, 5, 15);

      // USER
      // person
      fill(255, 255, 255);
      stroke(0, 0, 0);
      strokeWeight(7);
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
      if (randomFill == true) {
        userFill = color(random(255), random(255), random(255));
      }
      fill(userFill);
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
        // walking
        walking = false;
        left = false;
        right = false;
        if (keyPressed && kicking == false) {
          if (keyCode == LEFT && x == -10 &&millis() - punchTime > 350 && userX + 170 > 0 && arrowKeys == true && wasd == false) {
            userX = userX - 3;
            left = true;
            walking = true;
            walk();
          }
          if (key == 'a' && x == -10 && millis() - punchTime > 350 && userX + 170 > 0 && wasd == true && arrowKeys == false) {
            userX = userX - 3;
            left = true;
            walking = true;
            walk();
          }
          if (keyCode == RIGHT && x == -10 && millis() - punchTime > 350 && userX + 600 < 800 && arrowKeys == true && wasd == false) {
            userX = userX + 3;
            right = true;
            walking = true;
            walk();
          }
          if (key == 'd' && x == -10 && millis() - punchTime > 350 && userX + 600 < 800 && wasd == true && arrowKeys == false) {
            userX = userX + 3;
            right = true;
            walking = true;
            walk();
          }
        }
        // ducking
        if (ducking == true) {
          duck();
        }
        if (jumping == false && keyPressed) {
          if (arrowKeys == true) {
            if (keyCode == DOWN) {
              ducking = true;
            }
          } else { 
            if (key == 's') {
              ducking = true;
            }
          }
        } else {
          ducking = false;
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

      // is variables
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
      if (ducking == false) {
        bodyPointY = userY + 260;
        headY = userY + 215;
        armPointY = userY + 310;
      }


      // ENEMY
      // person
      fill(255, 255, 255);
      strokeWeight(7);
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
          if (left == true && userX > enemyX + 80 && userX < enemyX + 85) {
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

        // taking HP
        if (Epunching == true && ducking == false && userX > enemyX + 50) {
          userHP = userHP - 0.5;
        }
        if (Ekicking == true && jumping == false && userX > enemyX + 50) {
          userHP = userHP - 0.5;
        }

        // Eblocks
        if (level == 5) {
          EhitProb = 1;
        }
        if (Ex > -10) {
          Ejumping = true;
          Ejump();
          Ex += 0.05;
        }
        if (kicking == true && x == -10 && enemyY == 0 && EjumpProb < EhitProb && Ejumping == false && userX > enemyX + 80) {
          enemyHP = enemyHP - 0.5;
        }
        if (punching == true && Ejumping == false && userX > enemyX + 80) {
          if (EduckProb >= EhitProb) {
            Educking = true;
            Educk();
          }
          if (EduckProb < EhitProb && enemyHP > 0) {
            enemyHP = enemyHP - 0.5;
          }
        }
      }
    }

    // winning + losing + pausing
    if (enemyHP == 0) {
      win();
    }
    if (userHP == 0) {
      death();
    }
    if (paused == true && asking == false) {
      pause();
    }
    if (asking == true) {
      ask();
    }
  }
}

void mouseReleased() {
  // opening
  if (opening == true) {
    if (inMenu == false && mouseX > 230 && mouseX < 585 && mouseY > 200 && mouseY < 390) {
      opening = false;
      inGame = true;
    }
  }

  // tutorial
  if (inTutorial == true) {
    if (mouseX > 525 && mouseX < 765 && mouseY > 520 && mouseY < 570) {
      inTutorial = false;
      needsTutorial = false;
      inGame = false;
      opening = true;
    }
  }

  // menu
  if (inMenu == true) {
    if (inShop == false && inOptions == false && mouseX > 225 && mouseX < 550 && mouseY > 270 && mouseY < 340) {
      if (needsTutorial == true) {
        opening = false;
        inGame = false;
        inMenu = false;
        inTutorial = true;
      }
      if (needsTutorial == false) {
        inMenu = false;
        inGame = false;
        opening = true;
      }
    }
    if (inOptions == false && mouseX > 225 && mouseX < 550 && mouseY > 365 && mouseY < 435) {
      inShop = true;
    }
    if (inShop == false && mouseX > 225 && mouseX < 550 && mouseY > 460 && mouseY < 530) {
      inOptions = true;
    }
  }

  // shop
  if (inShop == true) {
    if (mouseX > 40 && mouseX < 165 && mouseY > 27 && mouseY < 77) {
      inShop = false;
      inMenu = true;
    }
  }

  // options
  if (inOptions == true) {
    if (mouseX > 40 && mouseX < 165 && mouseY > 27 && mouseY < 77) {
      inOptions = false;
      inMenu = true;
    }
  }

  // winning
  if (enemyHP == 0) {
    if (mouseX > 225 && mouseX < 550 && mouseY > 350 && mouseY < 420) {
      afterWin();
      inGame = false;
      opening = true;
    }
    if (mouseX > 225 && mouseX < 550 && mouseY > 465 && mouseY < 535) {
      afterWin();
      inMenu = true;
    }
  }

  // losing
  if (alive == false) {
    if (mouseX > 225 && mouseX < 550 && mouseY > 350 && mouseY < 420) {      
      reset();
      coins = coins + round(200/enemyHP);
      inGame = false;
      opening = true;
    }
    if (mouseX > 225 && mouseX < 550 && mouseY > 465 && mouseY < 535) {
      reset();
      inMenu = true;
    }
  }

  // leaving the game
  if (asking == true) {
    if (mouseX > 100 && mouseX < 300 && mouseY > 380 && mouseY < 480) {
      asking = false;
      inGame = false;
      inOptions = false;
      inMenu = true;
      paused = false;
      reset();
    }
    if (mouseX > 500 && mouseX < 700 && mouseY > 400 && mouseY < 500) {
      asking = false;
      paused = true;
    }
  }
}

void mousePressed() {
  // pausing
  if (inGame == true && alive == true && enemyHP > 0) {
    paused = true;
  }
  if (paused == true) {
    if (mouseX > 225 && mouseX < 550 && mouseY > 300 && mouseY < 370) {      
      paused = false;
    }
  }
  if (paused == true) {
    if (mouseX > 225 && mouseX < 550 && mouseY > 405 && mouseY < 475) {
      asking = true;
    }
  }

  // options
  if (inOptions == true) {
    if (mouseX < 400 && mouseY > 100) {
      optionX = 300;
      wasd = false;
      arrowKeys = true;
    }
    if (mouseX > 400 && mouseY > 100) {
      optionX = 500;
      arrowKeys = false;
      wasd = true;
    }
  }

  // shop
  if (inShop == true) {
    if (hasBlue == false && coins >= 100 && mouseX > 200 && mouseX < 300 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      hasBlue = true;
      coins = coins - 100;
    }
    if (hasGreen == false && coins >= 100 && mouseX > 300 && mouseX < 400 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      hasGreen = true;
      coins = coins - 100;
    }
    if (hasYellow == false && coins >= 150 && mouseX > 400 && mouseX < 500 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      hasYellow = true;
      coins = coins - 100;
    }
    if (hasBlue2 == false && coins >= 150 && mouseX > 500 && mouseX < 600 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      hasBlue2 = true;
      coins = coins - 150;
    }
    if (hasRandom == false && coins >= 200 && mouseX > 600 && mouseX < 700 && mouseY > 90 && mouseY < 510) {
      hasRandom = true;
      coins = coins - 150;
    }
    if (mouseX > 100 && mouseX < 200 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      userFill = color(255, 0, 0);
      userFillX = 150;
      randomFill = false;
    }
    if (hasBlue == true && mouseX > 200 && mouseX < 300 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      userFill = color(0, 0, 255);
      userFillX = 250;
      randomFill = false;
    }
    if (hasGreen == true && mouseX > 300 && mouseX < 400 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      userFill = color(0, 255, 0);
      userFillX = 350;
      randomFill = false;
    }
    if (hasYellow == true && mouseX > 400 && mouseX < 500 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      userFill = color(255, 255, 0);
      userFillX = 450;
      randomFill = false;
    }
    if (hasBlue2 == true && mouseX > 500 && mouseX < 600 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      userFill = color(0, 255, 255);
      userFillX = 550;
      randomFill = false;
    }
    if (hasRandom == true && mouseX > 600 && mouseX < 700 && mouseY > colorY + 90 && mouseY < colorY + 510) {
      userFill = color(random(255), random(255), random(255));
      userFillX = 650;
      randomFill = true;
    }
  }
}

void keyPressed() {
  if (opening == false) {
    // pausing
    if (key == 'p') {
      if (paused == true) {
        paused = false;
      } else {
        paused = true;
      }
    }

    // actions
    if (key == ' ' && punching == false) {
      punchTime = millis();
    }
    if (key == 'x' && punching == false && jumping == false && kicking == false) {
      kickTime = millis();
      if (EjumpProb >= EhitProb && userX > enemyX + 50 && Ejumping == false) {
        Ex = Ex + 0.0001;
      }
    }
    if (arrowKeys == true && wasd == false && keyCode == UP) {
      jumping = true;
    }
    if (wasd == true && arrowKeys == false && key == 'w') {
      jumping = true;
    }
  }
}
