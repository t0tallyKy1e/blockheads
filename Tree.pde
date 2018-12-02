class tree
{
    void display(float x, float y)
    {
        //trunk
        fill(brown);
        rect(x+3, y+3, 5, 45);

        //leaves
        fill(green);
        ellipse (x, y, 20, 20);
        ellipse (x+4, y+4, 40, 20);
        ellipse (x+11, y+2, 20, 20);
        ellipse (x+6, y+8, 20, 20);
        fill(0);
        ellipse(x, y, 3, 3);
        ellipse(x+16, y, 3, 3);
        rect(x-10, y+3, 34, 2);
    }
}
