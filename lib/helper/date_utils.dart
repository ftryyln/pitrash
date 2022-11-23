class DateUtils {
  static String monthToBulan(String month) {
    switch(month) {
      case "january": return "Januari";
      case "february": return "Februari";
      case "march": return "Maret";
      case "april": return "April";
      case "may": return "Mei";
      case "june": return "Juni";
      case "july": return "Juli";
      case "august": return "Agustus";
      case "september": return "September";
      case "october": return "Oktober";
      case "november": return "November";
      case "december": return "Desember";
      default: return"Bukan Bulan";
    }
  }

}