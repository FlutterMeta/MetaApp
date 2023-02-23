import 'package:flutter/cupertino.dart';

class AdminBlogController {
  AdminBlogController._();

  static ValueNotifier<AdminBlogMode> mode = ValueNotifier(AdminBlogMode.show);
}

enum AdminBlogMode {
  show,
  edit,
  preview,
}
