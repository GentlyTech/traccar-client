class Utils {
  static List<Uri> parseStringForUris(String str, { String delimiter = ";" }) {
    final List<Uri> results = [];
    if (str.isEmpty) return results;

    final splits = str.split(delimiter);

    for (String split in splits) {
      final Uri? result = Uri.tryParse(split);
      if (result == null || result.host.isEmpty || !(result.scheme == 'http' || result.scheme == 'https')) continue;
      results.add(result);
    }

    return results;
  }
}