class Language {
  LanguageId? _id;
  String? _dir;
  String? _langcode;
  bool? _isRTL;
  String? _icon;
  String? _name;

  Language(
      {LanguageId? id,
      String? dir,
      String? langcode,
      bool? isRTL,
      String? icon,
      String? name}) {
    if (dir != null) _dir = dir;
    if (langcode != null) _langcode = langcode;
    if (isRTL != null) _isRTL = isRTL;
    if (icon != null) _icon = icon;
    if (id != null) _id = id;
    if (name != null) _name = name;
  }
  LanguageId? get id {
    return _id;
  }

  String? get dir {
    return _dir;
  }

  String? get langCode {
    return _langcode;
  }

  bool? get isRTL {
    return _isRTL;
  }

  String? get icon {
    return _icon;
  }

  String? get name {
    return _name;
  }

  set dir(String? dir) {
    if (dir != null) _dir = dir;
  }

  set langCode(String? lang) {
    if (lang != null) _langcode = lang;
  }

  set name(String? name) {
    if (name != null) _name = name;
  }

  set isRTL(bool? isRTL) {
    if (isRTL != null) _isRTL = isRTL;
  }

  set icon(String? icon) {
    if (icon != null) _icon = icon;
  }

  set id(LanguageId? id) {
    if (id != null) _id = id;
  }
}

enum LanguageId {
  ar,
  en,
  tr,
}

class TranslateLabel {
  final Label id;
  final String name;

  TranslateLabel(this.id, this.name);
}

enum Label {
  title,
  body,
  newPost,
  newAlbum,
  postList,
  albumList,
  formTitle,
  formContent,
  editPost,
  editAlbum,
  postTitle,
  postContent,
  userId
}
