Balle maBalle = new Balle(100, 100, color(225,169,26));

int val[] = new int[63];
int affiche = 1;
boolean leftb = false;
boolean rightb = false;
boolean topb = false;
boolean botb = false;
boolean movement = false;
int NbrMur;
int Murx[] = new int[50];
int Mury[] = new int[50];
int xf;
int yf;
int niveau = 1;
int win = 1;

void setup(){
  
  
  size(900,700);
  smooth();
  Affiche();


}

class Balle {
  //Déclaration des paramètres de base de la balle
  float x;
  float y;
  float vitesseX; //AJOUT
  float vitesseY; //AJOUT
  color couleur;

  //Constructeur de la balle
  Balle (float nouvX, float nouvY, color nouvCouleur) {
    x          = nouvX;
    y          = nouvY;
    couleur    = nouvCouleur;

    vitesseX = 5; //AJOUT
    vitesseY = 5; //AJOUT

  }

  //Dessin de la balle
  void display() {
    fill(couleur);
    ellipse(x, y, 80, 80);
  }

 

  void testCollision() {
    if (x > width-50 || x < 50) {
       leftb = false;
       rightb = false;
       topb = false;
       botb = false;
       movement = false;
       if(x > width-50){
         x=x-5;
       }
       if(x < 50){
         x=x+5;
       }
      
     
    }
    if (y > height-50 || y < 50) {
      leftb = false;
      rightb = false;
      topb = false;
      botb = false;
      movement = false;
      if(y > height-50){
         y=y-5;
       }
       if(y < 50){
         y=y+5;
       }
    }
    for(int i = 0; i<NbrMur;i=i+1){
        if(Murx[i]+50 == x && Mury[i]+150 == y && topb == true ){
        
        
        
         leftb = false;
         rightb = false;
         topb = false;
         botb = false;
         movement = false;
         
         println("ici"+Murx[i]+" "+Mury[i]);
         println("ici"+x+" "+y);
         
         
        }
        if(Murx[i]+50 == x && Mury[i]-50 == y && botb == true ){
        
        
        
         leftb = false;
         rightb = false;
         topb = false;
         botb = false;
         movement = false;
         
         println("ici"+Murx[i]+" "+Mury[i]);
         println("ici"+x+" "+y);
         
       
        }
        if(Murx[i]-50== x && Mury[i]+50 == y && rightb == true ){
        
        
        
         leftb = false;
         rightb = false;
         topb = false;
         botb = false;
         movement = false;
         
         println("ici"+Murx[i]+" "+Mury[i]);
         println("ici"+x+" "+y);
         
         
        }
        if(Murx[i]+150== x && Mury[i]+50 == y && leftb == true ){
        
        
        
         leftb = false;
         rightb = false;
         topb = false;
         botb = false;
         movement = false;
         
         println("ici"+Murx[i]+" "+Mury[i]);
         println("ici"+x+" "+y);
         
     
        }
        
        
       
        
        }
        if(xf+50== x && yf+50 == y && movement == false ){
         leftb = false;
         rightb = false;
         topb = false;
         botb = false;
         movement = false;
         niveau = niveau +1;
         if(niveau == 13){
           niveau = 12;
           win = 0;
         }
         NbrMur = 0;
         xf = 0;
         yf = 0;
         for(int i=0;i<50;i=i+1){
           Murx[i]=0;
           Mury[i]=0;
         }
         Affiche();
         println("win");
        }
        
    
    }
  }



void Affiche(){
  String N[] = loadStrings("niveau"+niveau+".iwk");
  PImage drapeau = loadImage("flag.png");
  int l = 0;
  int c = 0;
  for(int e = 0; e<63; e=e+1){
      val[e]= N[l].charAt(c)-'0';
      if(val[e]==1){
        NbrMur = NbrMur+1;
      }
      c=c+1;
      
      if(c == 9){
        if(l==6){
          break;
        }
        c=0;
        l=l+1;
      }
    }
  
   
   stroke(0,0,0);
  for (int i=0,n=0,mur=0;i<700;i=i+100) {
      for (int y=0;y<900;y=y+100,n=n+1) {
      if (val[n]==0){
        fill(23,159,215);
        rect(y,i,100,100);  
      }
      if (val[n]==2 ){
        fill(23,159,215);
        rect(y,i,100,100);
        maBalle.x=y+50;
        maBalle.y=i+50;
        println(maBalle.x+" "+ maBalle.y);
        
      }
      if(val[n]==3){
        fill(23,159,215);
        rect(y,i,100,100);
        image(drapeau,y+35,i+25);
        xf = y;
        yf = i;
        
      }
      if(val[n]==1){
        fill(156,158,162);
        rect(y,i,100,100);
        Murx[mur]=y;
        Mury[mur]=i;
        println(mur+"x:"+Murx[mur]+"y:"+Mury[mur]);
        mur = mur +1;
        
      }
      

        
      }
     
     
    }
  
  }
  
 void CleanA(){
   PImage drapeau = loadImage("flag.png");
   String N[] = loadStrings("niveau"+niveau+".iwk");
  
  int l = 0;
  int c = 0;
  for(int e = 0; e<63; e=e+1){
      val[e]= N[l].charAt(c)-'0';
      c=c+1;
      
      if(c == 9){
        if(l==6){
          break;
        }
        c=0;
        l=l+1;
      }
    }
   stroke(0,0,0);
   background(255);
    for (int i=0,n=0;i<700;i=i+100) {
      for (int y=0;y<900;y=y+100,n=n+1) {
      if (val[n]==0){
        fill(23,159,215);
        rect(y,i,100,100);  
      }
      if(val[n]==3){
        fill(23,159,215);
        rect(y,i,100,100);
        image(drapeau,y+35,i+25);
        
      }
      if (val[n]==2 ){
        fill(23,159,215);
        rect(y,i,100,100);
     
        
      }
      if(val[n]==1){
        fill(156,158,162);
        rect(y,i,100,100);  
      }
      

        
      }
     
     
    }
  
 
 }
  
  
void LoliVictory(){
  background(255);
  textSize(60);
  fill(0, 102, 153);
  text("Victoire", 350, 60);
 
 


}




void draw() {
  fill(0, 0, 0, 1);
  rect(0, 0, width, height);

  if(win==0){
    LoliVictory();
  }
  if(win ==1){
    noStroke();
  maBalle.testCollision();
  if(leftb ==true){
      maBalle.x  = maBalle.x - maBalle.vitesseX;
  }
  if(rightb ==true ){
      maBalle.x = maBalle.x + maBalle.vitesseX;
  }
  if(topb ==true ){
      maBalle.y = maBalle.y - maBalle.vitesseY;
  }
  if(botb ==true ){
      maBalle.y = maBalle.y + maBalle.vitesseY;
  }
  //println(botb+" "+topb+" "+rightb+" "+leftb+" "+movement);
  
  CleanA();
  
  maBalle.display();
  }
}

void keyPressed() {
  if(movement == false){
  if (key == CODED){
    if (keyCode == LEFT || movement==false)   {
      leftb =true;
      rightb = false;
      topb = false;
      botb = false;
      movement=true;
    }
    if (keyCode == RIGHT || movement==false){
      leftb =false;
      rightb = true;
      topb = false;
      botb = false;
      movement=true;
    }
    if (keyCode == UP || movement==false){
      leftb =false;
      rightb = false;
      topb = true;
      botb = false;
      movement=true;
    }
    if (keyCode == DOWN || movement==false){
        leftb =false;
        rightb = false;
        topb = false;
        botb = true;
        movement=true;
    }
    
  }
}
  
}
