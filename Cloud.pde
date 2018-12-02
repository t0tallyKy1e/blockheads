class cloud
{
    float cposx = 0;
    float cposy = 0;

    void display(float x, float y)
    {
        cposx = x;
        cposy = y;


        fill(255);
        ellipse(x, y, 20, 20);
        ellipse(x+4, y+4, 40, 20);
        ellipse(x+11, y+2, 20, 20);
        ellipse(x+6, y+8, 20, 20);
        fill(0);
        ellipse(x, y, 3, 3);
        ellipse(x+16, y, 3, 3);
        rect(x-10, y+3, 34, 2);
    }

    void wind(float s)
    {
        cspeed = s;

        //less than wall
        if (c1x <= 800)
        {
            c1x = c1x + s;
        } 
        if (c2x <= 800)
        {
            c2x = c2x + s;
        } 
        if (c3x <= 800)
        {
            c3x = c3x + s;
        } 
        if (c4x <= 800)
        {
            c4x = c4x + s;
        } 
        if (c5x <= 800)
        {
            c5x = c5x + s;
        }
        if (c6x <= 800)
        {
            c6x = c6x + s;
        }


        //passes wall
        if (c1x > 800)
        {
            c1x = 20;
            c1y = random(30, 600);
        } 
        if (c2x > 800)
        {
            c2x = 20;
            c2y = random(30, 600);
        } 
        if (c3x > 800)
        {
            c3x = 20;
            c3y = random(30, 600);
        }  
        if (c4x > 800)
        {
            c4x = 20;
            c4y = random(30, 600);
        } 
        if (c5x > 800)
        {
            c5x = 20;
            c5y = random(30, 600);
        }
        if (c6x > 800)
        {
            c6x = 20;
            c6y = random(30, 600);
        }
    }
}
