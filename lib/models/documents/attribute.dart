enum AttributeScope {
  INLINE, // refer to https://quilljs.com/docs/formats/#inline
  BLOCK, // refer to https://quilljs.com/docs/formats/#block
  EMBEDS, // refer to https://quilljs.com/docs/formats/#embeds
}

class Attribute<T> {
  final String key;
  final AttributeScope scope;
  final T value;

  Attribute(this.key, this.scope, this.value);
}

class BoldAttribute extends Attribute<bool> {
  BoldAttribute() : super('bold', AttributeScope.INLINE, null);
}

class ItalicAttribute extends Attribute<bool> {
  ItalicAttribute() : super('italic', AttributeScope.INLINE, null);
}

class UnderlineAttribute extends Attribute<bool> {
  UnderlineAttribute() : super('underline', AttributeScope.INLINE, null);
}

class StrikeThroughAttribute extends Attribute<bool> {
  StrikeThroughAttribute() : super('strike', AttributeScope.INLINE, null);
}

class LinkAttribute extends Attribute<String> {
  LinkAttribute() : super('link', AttributeScope.INLINE, null);
}

class HeaderAttribute extends Attribute<int> {
  HeaderAttribute(int level) : super('header', AttributeScope.BLOCK, level);

  // H1 in HTML
  Attribute<int> get level1 => Attribute<int>(key, scope, 1);

  // H2 in HTML
  Attribute<int> get level2 => Attribute<int>(key, scope, 2);

  // H3 in HTML
  Attribute<int> get level3 => Attribute<int>(key, scope, 3);
}

class ListAttribute extends Attribute<String> {
  ListAttribute(String val) : super('list', AttributeScope.BLOCK, val);

  // "attributes":{"list":"ordered"}
  Attribute<String> get ordered => Attribute<String>(key, scope, 'ordered');

  // "attributes":{"list":"bullet"}
  Attribute<String> get bullet => Attribute<String>(key, scope, 'bullet');
}

class CodeBlockAttribute extends Attribute<bool> {
  CodeBlockAttribute() : super('code-block', AttributeScope.BLOCK, null);
}

class BlockQuoteAttribute extends Attribute<bool> {
  BlockQuoteAttribute() : super('blockquote', AttributeScope.BLOCK, null);
}