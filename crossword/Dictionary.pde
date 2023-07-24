class Dictionary {
  ArrayList<String> lexicon = new ArrayList<String>();

  Dictionary() {
    /* Constructor */
    String[] inputArray = {
      "big",
      "bat",
      "cat",
      "fat",
      "sat",
      "sit",
      "tit",
    };

    // Add Wordlist into Dictionary
    for (int i = 0; i < inputArray.length; i++) {
      lexicon.add(inputArray[i]);
    }
  }
  
  String getWord() {
    /* Return Random Word from Dictionary */
    return this.lexicon.get(floor(random(this.lexicon.size())));
  }
    
}
