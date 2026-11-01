import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int player_width = 600;
final int player_height = 600;
float x = 300;
float y = 200;
final float sensitivity = 30;
int last_interval = 0;

int t_pock = 1000000000;
int t_roll = 1000000000;

Minim minim;//audio context
AudioPlayer pock;
AudioPlayer roll;

boolean started = false;

void setup()
{
  size(1200,800);
  minim = new Minim(this);
  pock = minim.loadFile("240313__greenvwbeetle__marble-drop.wav");
  roll = minim.loadFile("334223__jradcoolness__marble-rolling.wav");
  noStroke();
}

void draw()
{
  if (!started)
  {
    background(255);
    stroke(0); fill(0);
    textSize(20);
    text("Generating maze", width / 2, height / 2);
    if (millis() > 2300) started = true;
    return;
  }
  
  background(255);
  x += 0.1 * (mouseX - x);
  y += 0.1 * (mouseY - y);
  
  fill(0);
  stroke(0);
  rect(x - (player_width / 2), y - (player_height / 2), player_width, player_width);
  text("Shake the marble out of the black box",20,20);
  text("Use your ears well!",20,50);
  //text(last_interval,20,40);
  
  fill(255);
  noStroke();
  ellipse(x, y + (player_height / 2), 10, 10);

  if ( (mouseX < pmouseX - 1 || mouseX > pmouseX + 1) && abs(mouseY - pmouseY) < 1)
  {
    last_interval = 10 + int(random(0, 40));
    t_roll = millis() + last_interval; 
  }
  if (millis() > t_roll)
  {
    roll.play();
    roll.rewind();
    t_roll = 1000000000;
    t_pock = millis() + 100 + int(random(0, 400));
  }

  if (mouseX < pmouseX - sensitivity || mouseX > pmouseX + sensitivity
    ||  mouseY > pmouseY + sensitivity
  ) 
  {
    last_interval = 10 + int(random(0, 400));
    t_pock = millis() + last_interval; 
  }
  if (millis() > t_pock)
  {
    pock.play();
    pock.rewind();
    t_pock = 1000000000;
  }
}