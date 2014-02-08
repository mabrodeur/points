
class Points {
  float posX,posY,largeur,hauteur;
  color couleur;
  float vitesse;
  boolean actif=false;
  Points (float X, float Y,float L,float H,color C, boolean b ){ 
    vitesse=random(0.1,1);
    posX=X;  
    posY=Y;
    largeur=L;
    hauteur=H;
    couleur=C;
    actif = b;
  }
}
