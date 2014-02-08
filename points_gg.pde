import ddf.minim.*;
Minim minim;
AudioPlayer player;
int gauche;
int droit;
import controlP5.*;
ControlP5 cp5;


int shapeSize = 5;
int vitesseGlobale = 20;
float test1 = 1;

boolean voila=true;

int posX = 0;
int posY = 0;
int currentPoint = -1; 
int widthJO = 1920;
int lenghtJO = 1080;
int numP = 1000;
int counter = 0;
float ratioD =  1000;
float d; 
int i;

float[] TpointsX = new float[10]; 
float[] TpointsY = new float[10]; 
Points[] TablePoints = new Points[numP]; 



void setup () {
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("tommy.mp3");

  // play the file from start to finish.
  // if you want to play the file again, 
  // you need to call rewind() first.
  player.play();



  size(widthJO, lenghtJO, P3D);  //créé une fenêtre avec les varibles L&H
  smooth();
  frameRate(30);           // vitesse d'opération de la scène

  for (int i=0 ; i < numP; i++) {  //pour le nombre de points désiré, prépare un tableau avec nul
    TablePoints[i]=new Points (100, 100, 100, 100, color(255), false);
  }

  cp5 = new ControlP5(this);
  cp5.addSlider("ratioD")
    .setPosition(1750, 960)
      .setSize(100, 20)
        .setRange(20, 1000)
          ;
  cp5.addSlider("shapeSize")
    .setPosition(1750, 990)
      .setSize(100, 20)
        .setRange(5, 20)
          ;
  cp5.addSlider("vitesseGlobale")
    .setPosition(1750, 1020)
      .setSize(100, 20)
        .setRange(0, 1000)
          ;
  cp5.addSlider("test1")
    .setPosition(1750, 1050)
      .setSize(100, 20)
        .setRange(1, 50)
          ;
}



void draw () { 
  
  background(0);
  // fill(100);
  // rect(width-180, height- 100, 180, 100 );
  for (int i=0 ; i < numP; i++) {    //pour le nombre de points désiré, 




    if (TablePoints[i].actif == true) {      // si le Tableau à été activé à travers mousePressed
      pushMatrix();
      noStroke();
      TablePoints[i].posX+=(sin(frameCount/ test1)*vitesseGlobale*TablePoints[i].vitesse); //prends la valeur de posX et fait une opéraiton pour le faire bouger
      TablePoints[i].posY+=(cos(frameCount/test1)*vitesseGlobale*TablePoints[i].vitesse); //prends la valeur de posX et fait une opéraiton pour le faire bouger
      fill(TablePoints[i].couleur); //remplis la couleur avec la couleur de la classe TablePoints[i].couleur
      ellipse(TablePoints[i].posX, TablePoints[i].posY, TablePoints[i].largeur, TablePoints[i].hauteur); //désine un rectangle avec les valeurs de la classe TablePoints
      popMatrix();


      for (int j = 0; j < numP ; j++) {
        if (TablePoints[j].actif == true && i != j) {
          d = dist(TablePoints[i].posX, TablePoints[i].posY, TablePoints[j].posX, TablePoints[j].posY);
          if (d<ratioD) {
            pushMatrix();
            strokeWeight(2);
            stroke(random(255), random(255), random(255), (255-(d*255/ratioD)));
            line(TablePoints[i].posX, TablePoints[i].posY, TablePoints[j].posX, TablePoints[j].posY);
            popMatrix();
          }
        }
      }
    }
  }
}



void mousePressed () {
  if (!(mouseX>width-180 && mouseX<width && mouseY>height- 130 && mouseY<height)) { 
    if (counter == numP) { //ré-initialise le conter pour remplir de  TablePoints[]
      counter=0;
    }
    TablePoints[counter] = new Points (mouseX, mouseY, shapeSize, shapeSize, color(random(100, 255), random(100, 255), random(50, 255)), true); 
    // TablePoints[conter] = new Points (mouseX, mouseY, 15, 15, color(255,(100+(numP+10)),255), true);
    counter++;
    println(counter);
  }
}
//   if(  ((abs(TablePoints[i].posX - TablePoints[i+1].posX)) < 50)  &&  ((abs(TablePoints[i].posY - TablePoints[i+1].posY))< 50)   ) {
//  line(TablePoints[i].posX,TablePoints[i].posY,TablePoints[i+1].posX,TablePoints[i+1].posY); 
//  }

