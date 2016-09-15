import rita.*;

RiGrammar grammar;
RiText[] rts = new RiText[3];

void setup()
{
  size(650, 200);

  RiText.defaultFontSize(30);
  RiText.defaults.alignment = CENTER;

  rts[0] = new RiText(this, "click to", width / 2, 75);
  rts[1] = new RiText(this, "generate", width / 2, 110);
  rts[2] = new RiText(this, "a haiku murakami", width / 2, 145);

  grammar = new RiGrammar(this);
  grammar.loadFrom("haiku.json");
}

void draw()
{
  background(230, 240, 255);
  for (int k = 0; k < rts.length; k++)
    rts[k].draw();
    fill(0);
    textSize(12);
    text("generate your own at: http://bit.ly/HaikuMurakami",width*8/10,height*19/20);
}

void mouseReleased()
{
  String result = grammar.expand();
  String[] lines = result.split("%");
  for (int i = 0; i < rts.length; i++) 
    rts[i].textTo(lines[i], 1.0);
  
}

void keyPressed()
{
  saveFrame("###.png");
}
