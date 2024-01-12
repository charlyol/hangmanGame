void draw () { //<>// //<>//
  exit();
}
void setup() {
  String [] listeDeMots = {"test", "voiture", "clavier", "train", "tracteur", "triangle"};
  int indexListeDeMots = 0;
  int choixDuMot = (int) random(1, listeDeMots.length);
  String motAModifier = listeDeMots[choixDuMot];
  int tailleDuMot = motAModifier.length();
  char [] motADeviner = new char [tailleDuMot];
  for (indexListeDeMots=0; indexListeDeMots<tailleDuMot; indexListeDeMots++) {
    motADeviner[indexListeDeMots] = motAModifier.charAt(indexListeDeMots);
  }
  int index = 0;
  char lettreTaper = '_';
  index = motADeviner.length;
  int index2=26-index;
  char [] motEncours = new char [index];
  int vie = 10;
  index=0;
  do {
    motEncours[index]='_';
    index++;
  } while (index!=motEncours.length);
  println("le mot à découvrir est de "+index+" lettres");
  char [] lettreDejaTaper = new char [index2];
  int indexDejaTaper = 0;
  do {
    lettreDejaTaper[indexDejaTaper]='_';
    indexDejaTaper++;
  } while (indexDejaTaper!=lettreDejaTaper.length);
  indexDejaTaper = 0;
  boolean game=true;
  boolean win=false;
  while (win==false && vie!=0) {
    lettreTaper = javax.swing.JOptionPane.showInputDialog(null, "Saisir une lettre ?").charAt(0);
    int  i = 0;
    game=false;
    while (i<motADeviner.length) {
      if (lettreTaper==motADeviner[i]) {
        motEncours[i] = lettreTaper ;
        game=true;
      }
      i++;
    }
    if (game==false) {
      vie--;
      lettreDejaTaper[indexDejaTaper]=lettreTaper;
      indexDejaTaper++;
    }
    win=true;
    for (i=0; i<index; i++) {
      if (motADeviner[i] != motEncours[i]) {
        win =false;
      }
    }
    println("---__ Mot à découvrir __---");
    printGuessedWord(motEncours);
    println();
    println("---__lettres déjà saisies__---");
    displayCharactersAlreadyTyped(lettreDejaTaper);
    println();
    println("---------------------------");
    if (vie>=2 && vie<=10) {
      println("Attention plus que " +vie+" chances");
    } else if (vie==1) {
      println("Attention plus qu'une chance");
    } else {
      println("Game Over");
    }
    println();
    println("---------------------------");
  }
}
