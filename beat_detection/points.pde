
class Points {
  float positionOriginaleX, positionOriginaleY, posX,posY,largeur,hauteur;
  color couleur;
  float vitesse;
  boolean actif=false;
  Points (float X, float Y,float L,float H,color C, boolean b ){ 
    vitesse=random(0.1,1);
    positionOriginaleX = X;
    positionOriginaleY = Y;
    posX=X;  
    posY=Y;
    largeur=L;
    hauteur=H;
    couleur=C;
    actif = b;
  }
}