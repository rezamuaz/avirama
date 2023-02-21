class UserCheckStatus {
  static statusCheck(String status) {
    switch (status) {
      case "TL":
        return "Team Leader";
      case "MD":
        return "Merchandise";
      case "SPG":
        return "Sales Promotion Girl";
      default:
    }
  }
}
