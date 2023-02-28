class Chains {
  static String getChain(int chainNumber) {
    switch (chainNumber) {
      case 5:
        return "Goerli";

      default:
        return "Unknown";
    }
  }
}
