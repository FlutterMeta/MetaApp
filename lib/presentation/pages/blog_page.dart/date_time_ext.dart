part of "blog_page.dart";

extension on DateTime {
  String _format() {
    final DateFormat formatter = DateFormat("d MMM y, hh:mm");
    final String formatted = formatter.format(this);
    return formatted;
  }
}
