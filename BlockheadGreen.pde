class Blockhead
{
    Blockhead(float x, float y, float w, float h, color c)
    {
        posx = x;
        posy = y;
        bwid = w;
        bhei = h;
        col = c;
    }

    void display()
    {
        //hair
        fill(orange);
        rect(posx, posy, bwid, 5);

        //head
        fill(lightskin);
        rect(posx, posy+5, bwid, 15);

        //face
        fill(0);
        rect(posx+2, posy+15, 18, 2);
        ellipse(posx+6, posy+13, 2, 2);
        ellipse(posx+18, posy+13, 2, 2);

        //torso
        fill(col);
        rect(posx, posy+20, bwid, 25);

        //arm
        fill(lightskin);
        rect(posx-1, posy+40, 5, 5);
        fill(0);
        rect(posx+3, posy+25, 1, 15);

        //pants
        fill(blue);
        rect(posx, posy+45, bwid, 20);

        //shoes
        fill(255);
        rect(posx, posy+65, bwid, 5);
        fill(0);
        rect(posx+10, posy+65, 1, 5);
    }

    void move()
    {
        if (keyPressed)
        {
            //left
            if (key=='a')
            {
                posx=posx-bhspeed;
            }

            //right
            if (key=='d')
            {
                posx=posx+bhspeed;
            }

            //punch!
            if (key == 'f')
            {
                fill(col);
                rect(posx+20, posy+20, 20, 5);
                fill(lightskin);
                rect(posx+40, posy+20, 5, 5);
            }
        }
        if (jumpint == 0)
        {
            if (keyPressed)
            {
                if (key == 'w')
                {
                    posy = posy - 85;
                }
            }
        } else 
        {
            jumpint = 0;
        }
    }

    void wallCollision()
    {
        if (posx > width-40)
        {
            posx = width-40;
        }
        if (posx < width-780)
        {
            posx = width-780;
        }
        if (posy < height-780)
        {
            posy = height-780;
        }
        if (posy > width-170)
        {
            posy = width-170;
        }
    }

    void gravity()
    {
        if (posy < 630)
        {
            posy = posy+gravity;
        }
    }



    //----------------------Collision Start-----------------------
    void rectCollision()
    {
        //blockhead sides
        float bhtop = posy;
        float bhbottom = posy + bhei;
        float bhleft = posx;
        float bhright = posx + bwid;

        if (bhleft <= p1posx + pwid && bhtop <= p1posy + phei && bhright >= p1posx && bhbottom >= p1posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p2posx + pwid && bhtop <= p2posy + phei && bhright >= p2posx && bhbottom >= p2posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p3posx + pwid && bhtop <= p3posy + phei && bhright >= p3posx && bhbottom >= p3posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p4posx + pwid && bhtop <= p4posy + phei && bhright >= p4posx && bhbottom >= p4posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p5posx + pwid && bhtop <= p5posy + phei && bhright >= p5posx && bhbottom >= p5posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p6posx + pwid && bhtop <= p6posy + phei && bhright >= p6posx && bhbottom >= p6posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p7posx + pwid && bhtop <= p7posy + phei && bhright >= p7posx && bhbottom >= p7posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else if (bhleft <= p8posx + pwid && bhtop <= p8posy + phei && bhright >= p8posx && bhbottom >= p8posy)
        {
            bhspeed = 0;
            gravity = 0;
            bhspeed = 10;
            jumpint = 0;
        } else  if (bhleft <= p9posx + pwid && bhtop <= p9posy + phei && bhright >= p9posx && bhbottom >= p9posy)
        {
            gravity = 0;
            jumpint = 0;

            //---------------------------------DISPLAY "WINNER!"---------------------------------------
            //W
            fill(color(255, 0, 0));
            rect(150, 45, 75, 75);
            fill(0);
            rect(172, 45, 4, 35);
            rect(203, 45, 4, 35);
            rect(189, 85, 4, 35);

            //I
            fill(color(0, 255, 0));
            rect(225, 45, 35, 75);

            //N
            fill(color(0, 0, 255));
            rect(260, 45, 75, 75);
            fill(0);
            rect(285, 85, 4, 35);
            rect(299, 45, 4, 35);

            //N
            fill(color(255, 255, 0));
            rect(335, 45, 75, 75);
            fill(0);
            rect(360, 85, 4, 35);
            rect(374, 45, 4, 35);

            //E
            fill(color(255, 0, 255));
            rect(410, 45, 75, 75);
            fill(0);
            rect(450, 65, 35, 4);
            rect(450, 85, 35, 4);

            //R
            fill(color(255, 0, 0));
            rect(485, 45, 75, 75);
            fill(0);
            rect(525, 57, 4, 20);
            rect(525, 85, 35, 4);
            rect(525, 95, 4, 25);

            //!
            fill(color(0, 255, 0));
            rect(560, 45, 35, 75);
            fill(0);
            rect(560, 100, 35, 4);
        } else if (posy == 630)
        {
            jumpint = 0;
        } else {
            col = random;
            bhspeed = 10;
            gravity = 5;
            jumpint = 1;
        }
    }
}
