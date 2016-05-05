void setup()
{
  size(500, 500);
  playerX = width / 2;
  playerY = height - (playerHeight * 2);
  spaceX = width / 2;
}

float playerX;
float playerY;
float spaceX;
float spaceY;
float playerWidth = 30;
float playerHeight = 40;
float spaceWidth =50;
int frame = 60;
int score;

void draw()
{
    // Draw the lines
  stroke(0);
  for (float x = 0 ; x < width ; x += 50)
  {
    line(x, 0, x, height);
    line(0, x, width, x);
  }
  background(0);
  stroke(255);
  
  // Draw the player
  float halfWidth = playerWidth * 0.9f;
  float halfHeight = playerHeight * 0.5f;
  
  line (playerX - halfWidth, playerY + halfHeight
    , playerX + halfWidth, playerY + halfHeight);
  line (playerX - halfWidth, playerY + halfHeight
      , playerX - halfWidth, playerY);
  line(playerX - halfWidth, playerY
      , playerX - (playerWidth * 0.25f), playerY - halfHeight);
  line(playerX - (playerWidth * 0.25f), playerY - halfHeight
      , playerX + (playerWidth * 0.25f), playerY - halfHeight);
  line(playerX + (playerWidth * 0.25f), playerY - halfHeight
      , playerX + halfWidth, playerY);
  line(playerX + halfWidth, playerY
    , playerX + halfWidth, playerY + halfHeight);
   

    boolean space = true;
  // Draw the ship
 for (int i = 0; i > 20; i+=1){
   ellipse( i * 20,200,20,20);
 }
  stroke(255);
  float saucerHeight = spaceWidth * 0.7f;
  float halfSpaceWidth = spaceWidth * 0.5f;
  line(spaceX + halfSpaceWidth, spaceY, spaceX, spaceY + saucerHeight);
  line(spaceX + halfSpaceWidth, spaceY, spaceX + spaceWidth, spaceY + saucerHeight);
  line(spaceX, spaceY + saucerHeight, spaceX + spaceWidth, spaceY + saucerHeight);
  float feet = spaceWidth * 0.2f;
  line(spaceX + feet, spaceY + saucerHeight, spaceX, spaceY + spaceWidth);
  line(spaceX + spaceWidth - feet, spaceY + saucerHeight, spaceX + spaceWidth, spaceY + spaceWidth);
  feet = spaceWidth * 0.4f;
  line(spaceX + feet, spaceY + saucerHeight, spaceX, spaceY + spaceWidth);
  line(spaceX + spaceWidth - feet, spaceY + saucerHeight, spaceX + spaceWidth, spaceY + spaceWidth);

  
  if (frameCount % frame == 0)
  {
    spaceY ++;
    spaceX += random(-10.0f, 10.0f);
       
    frame --;
    if (frame == 0)
    {
      frame = 60;
    }
     
    
  }
   if (keyPressed)
   {
     if (keyCode == LEFT && playerX > halfWidth)
     {
       playerX --;
     }
     if (keyCode == RIGHT && playerX < width - halfWidth)
     {
       playerX ++; 
     }
     
     if (key == ' ')
     {
       // Check for hit
       float lazerY = 0;
       if (playerX > spaceX  && playerX < spaceX + spaceWidth)
       {
         // I have hit the space ship
         lazerY = spaceY;
         spaceY = 0;
         spaceX = random(halfSpaceWidth, width - halfSpaceWidth);
         score ++;
       }
       else
       {
         lazerY = 0;
       }
       line(playerX, playerY - halfWidth, playerX, lazerY);
     }
   }
   text("Score: " + score, 10, 10); 
    }



