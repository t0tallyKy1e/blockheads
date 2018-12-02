// blockheads
// Created by: Kyle Demers 'AKA' t0tallyKy1e
// basic platformer based off of simple style of blockheads
// rules: climb to the red platform to win
// *NOTE* If using Arduino, comment out BlockheadGreen.move();
//        If using keyboard, comment out BlockheadGreen.knob(); and all arduino related lines

// 'a' key = left
// 'd' key = right
// 'f' key = punch (just there for fun)
// 'w' key = jump

// RELEASE JUMP BUTTON AS FAST AS POSSIBLE FOR BEST RESULTS


/*
 import processing.serial.*;
 import org.firmata.*;
 import cc.arduino.*;
 //---------------------------arduino-------------------------------
 
 Arduino board;
 int knobPin = 0;
 int knobVal = 0;
 int button = 0;
 int buttonPin = 13;
 int lightPin = 12;
 */

//color variables
color blue = color(0, 0, random(255));
color rangreen = color(0, random(255), 0);
color red = color(255, 0, 0);
color gray = color(100);
color orange = color(232, 182, 56);
color darkskin = color(95, 89, 60);
color lightskin = color(221, 240, 160);
color green = color(0, 200, 0);
color random = color(random(255), random(255), random(255));
color brown = color(95, 85, 28);
color sky = color(0, 200, 255);

//Platform Global Variables
float pwid = 50;
float phei = 5;

//platform 1 variables
float p1posx = random(100, 550);
float p1posy = 630;

//platform 2 variables
float p2posx = random(100, 550);
float p2posy = 570;

//platform 3 variables
float p3posx = random(100, 550);
float p3posy = 510;

//platform 4 variables
float p4posx = random(100, 550);
float p4posy = 450;

//platform 5 variables
float p5posx = random(100, 550);
float p5posy = 390;

//platform 6 variables
float p6posx = random(100, 550);
float p6posy = 330;

//platform 7 variables
float p7posx = random(100, 550);
float p7posy = 270;

//platform 8 variables
float p8posx = random(100, 550);
float p8posy = 210;

//platform 9 variables
float p9posx = random(100, 550);
float p9posy = 150;



//------------------------------GRAVITY---------------------------
float gravity = 7.5;



//blockhead variables
float bhspeed = 10;
float posx;
float posy;
float bwid = 20;
float bhei = 70;
int jumpint = 0;
color col;
Blockhead BlockheadGreen;



//cloud variables
float cspeed = 0;

float c1x = 390;
float c2x = 450;
float c3x = 215;
float c4x = 80;
float c5x = 540;
float c6x = 680;

float c1y = 650;
float c2y = 550;
float c3y = 350;
float c4y = 250;
float c5y = 150;
float c6y = 50;

cloud cloud1;
cloud cloud2;
cloud cloud3;
cloud cloud4;
cloud cloud5;
cloud cloud6;

//sun variables
float sunx = 5;
float suny = 799;

//tree variables
float treey = 652;
tree tree1;
tree tree2;

void setup()
{
    noStroke();
    size(800, 800);
    BlockheadGreen = new Blockhead(100, 630, bwid, bhei, random);
    cloud1 = new cloud();
    cloud2 = new cloud();
    cloud3 = new cloud();
    cloud4 = new cloud();
    cloud5 = new cloud();
    cloud6 = new cloud();

    tree1 = new tree();
    tree2 = new tree();

    /*
  board = new Arduino(this, "/dev/tty.usbmodemfa141", 57600);
     board.pinMode(buttonPin, Arduino.INPUT);
     board.pinMode(lightPin, Arduino.OUTPUT);
     */
}

void draw()
{
    /*
  knobVal = board.analogRead(knobPin);
     button = board.digitalRead(buttonPin);
     */

    //display background
    background(sky);

    //Tree Functions
    tree1.display(200, treey);
    tree2.display(650, treey);



    //----------------------------------Start of Sun--------------------------------------
    fill(255, 255, 0);
    ellipse(sunx, suny, 50, 50);
    fill(0);
    rect(sunx-15, suny-5, 40, 2);
    ellipse(sunx-9, suny-8, 3, 3);
    ellipse(sunx+18, suny-8, 3, 3);

    sunset();
    sunx = sunx + 1;
    //----------------------------------End of Sun----------------------------------------


    //Cloud Functions
    cloud1.display(c1x, c1y);
    cloud2.display(c2x, c2y);
    cloud3.display(c3x, c3y);
    cloud4.display(c4x, c4y);
    cloud5.display(c5x, c5y);
    cloud6.display(c6x, c6y);


    cloud1.wind(.5);
    cloud2.wind(.5);
    cloud3.wind(.5);
    cloud4.wind(.5);
    cloud5.wind(.5);
    cloud6.wind(.5);


    //display walls
    fill(gray);
    rect(0, 20, 20, 680);
    rect(780, 20, 20, 680);
    rect(0, 0, 800, 20);

    //display ground
    fill(rangreen);
    rect(0, 700, 800, 100);



    //--------------------------display title on bottom-------------------
    //B
    fill(color(255, 0, 0));
    rect(20, 750, 30, 30);
    fill(0);
    rect(37, 765, 15, 2);
    rect(38, 756, 2, 6);
    rect(38, 770, 2, 6);

    //L
    fill(color(0, 255, 0));
    rect(50, 750, 15, 30);

    //O
    fill(color(0, 0, 255));
    rect(65, 750, 30, 30);
    fill(0);
    rect(79, 759, 2, 14);

    //C
    fill(color(255, 255, 0));
    rect(95, 750, 30, 30);
    fill(0);
    rect(109, 759, 2, 14);
    rect(110, 765, 15, 2);

    //K
    fill(color(255, 0, 255));
    rect(125, 750, 30, 30);
    fill(0);
    rect(142, 765, 15, 2);
    rect(139, 750, 2, 13);
    rect(139, 769, 2, 11);

    //H
    fill(color(0, 255, 255));
    rect(155, 750, 30, 30);
    fill(0);
    rect(169, 750, 2, 13);
    rect(169, 769, 2, 11);

    //E
    fill(color(255, 0, 0));
    rect(185, 750, 30, 30);
    fill(0);
    rect(200, 763, 15, 2);
    rect(200, 770, 15, 2);

    //A
    fill(color(0, 255, 0));
    rect(215, 750, 30, 30);
    fill(0);
    rect(229, 754, 2, 12);
    rect(229, 770, 2, 10);

    //D
    fill(color(0, 0, 255));
    rect(245, 750, 30, 30);
    fill(0);
    rect(259, 759, 2, 14);
    stroke(rangreen);
    line(260, 750, 274, 765);
    noStroke();
    fill(rangreen);
    triangle(261, 750, 275, 750, 275, 765);

    //S
    fill(color(255, 255, 0));
    rect(275, 750, 30, 30);
    fill(0);
    rect(290, 763, 15, 2);
    rect(275, 770, 15, 2);

    //---------------------------------End of Title---------------------------------------

    //Blockhead Functions
    BlockheadGreen.display();
    BlockheadGreen.move();
    BlockheadGreen.gravity();
    //BlockheadGreen.knob();

    //COLLISIONS
    BlockheadGreen.rectCollision();
    BlockheadGreen.wallCollision();

    //----------------------------- Platform Generation Start ----------------------------
    //Platform 1
    fill(0);
    rect(p1posx, p1posy, pwid, phei);

    //Platform 2
    rect(p2posx, p2posy, pwid, phei);
    if (p2posx < p1posx-50 || p2posx > p1posx+50)
    {
        p2posx = p1posx+50;
    }

    //Platform 3
    rect(p3posx, p3posy, pwid, phei);
    if (p3posx < p2posx-50 || p3posx > p2posx+50)
    {
        p3posx = p2posx+50;
    }

    //Platform 4
    rect(p4posx, p4posy, pwid, phei);
    if (p4posx < p3posx-50 || p4posx > p3posx+50)
    {
        p4posx = p3posx+50;
    }

    //Platform 5
    rect(p5posx, p5posy, pwid, phei);
    if (p5posx < p4posx-50 || p5posx > p4posx+50)
    {
        p5posx = p4posx+50;
    }

    //Platform 6
    rect(p6posx, p6posy, pwid, phei);
    if (p6posx < p5posx-50 || p6posx > p5posx+50)
    {
        p6posx = p5posx-50;
    }

    //Platform 7
    rect(p7posx, p7posy, pwid, phei);
    if (p7posx < p6posx-50 || p7posx > p6posx+50)
    {
        p7posx = p6posx-50;
    }

    //Platform 8
    rect(p8posx, p8posy, pwid, phei);
    if (p8posx < p7posx-50 || p8posx > p7posx+50)
    {
        p8posx = p7posx-50;
    }

    //Platform 9
    fill(red);
    rect(p9posx, p9posy, pwid, phei);
    if (p9posx < p8posx-50 || p9posx > p8posx+50)
    {
        p9posx = p8posx+50;
    }
    //-------------------------------- Platform Generation End ---------------------------
}

void sunset()
{
    float a = .005;
    float h = 399.5;
    float k = 10;

    if (suny < 800)
    {
        suny = a*pow(sunx-h, 2)+k;
    } else if (sunx == 800)
    {
        sunx = 5;
        suny = 799;
    }
}
