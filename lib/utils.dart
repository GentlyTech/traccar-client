class Utils {
  static List<Uri> parseStringForUris(String str, {String delimiter = ";"}) {
    final List<Uri> results = [];
    if (str.isEmpty) return results;

    final splits = str.split(delimiter);

    for (final String split in splits) {
      final Uri? result = Uri.tryParse(split);
      if (result == null ||
          result.host.isEmpty ||
          !(result.scheme == 'http' || result.scheme == 'https'))
        continue;
      results.add(result);
    }

    return results;
  }

  static String urisToString(List<Uri> uris) {
    if (uris.isEmpty) return "";

    if (uris.length == 1) {
      return formatUri(uris.first);
    }

    final StringBuffer buffer = new StringBuffer();

    for (final Uri uri in uris) {
      buffer.write("${formatUri(uri)};");
    }

    return buffer.toString();
  }

  static String formatUri(Uri uri) {
    if (uri.path.isEmpty || uri.path == '') {
      return '$uri/';
    }
    return uri.toString();
  }
}
