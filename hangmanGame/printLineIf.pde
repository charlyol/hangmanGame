void displayCharactersAlreadyTyped (char [] listChar ) {
  for (int i=0; i<listChar.length; i++) {
    if (listChar[i]!='_') {
      print("|"+listChar[i]+"|");
    }
  }
}
