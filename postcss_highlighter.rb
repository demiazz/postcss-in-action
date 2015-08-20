class PostcssHighlighter < Highlighter
  def none(code)
    code
  end

  def default_highlight(code)
    code.gsub(/(true|false|null|nil)/,'<mark>\0</mark>')
        .gsub(/"[^"]+"|'[^']+'/,      '<mark class="string">\0</mark>')
        .gsub(/(\s|^)(#[^\{].*$)/,    '\1<mark class="comment">\2</mark>')
        .gsub(/(\(|\[|,|^|\s|=)(\d+(px|deg|%|m?s|))(\)|,|$|\s|;)/,
          '\\1<mark>\\2</mark>\\4')
  end

  def css(code)
    code.gsub(/^([^\s].*){/, '<mark>\1</mark>{')
        .gsub(/\/\*.*\*\//,  '<mark class="comment">\0</mark>')
  end

  def sass(code)
    code.gsub(/\..*/,         '<mark>\0</mark>')
        .gsub(/\+.*/,         '<mark>\0</mark>')
        .gsub(/(@|\$)[\w-]*/, '<mark>\0</mark>')
        .gsub(/\/\/.*/,       '<mark class="comment">\0</mark>')
  end

  # JavaScript

  def js(code)
    default_highlight(code)
      .gsub(/\/\*\ .*\ \*\//,                             '<mark class="comment">\0</mark>')
      .gsub(/(\s|^)(export|default\ |import|from|const)/, '\1<mark>\2</mark>')
      .gsub(/(\s|^)(class\ |static\ |extends\ )/,         '\1<mark>\2</mark>')
      .gsub(/(\s|^)(if|var|function|return|=&gt;|let)/,   '\1<mark>\2</mark>')
      .gsub(/\/[^<\*>\/]+\/g?/,                           '<mark>\0</mark>')
  end

  def js_css_modules(code)
    js(code).gsub(/@EasyStyle\(css\)/, mark_important)
  end

  # PostCSS

  def postcss(code)
    code.gsub(/@(\w|\-)+/,      mark)
        .gsub(/:?--(\w|\-)+/,     mark)
        .gsub(/\$\((\w|\-)+\)/, mark)
        .gsub(/\$(\w|\-)+/,     mark)
        .gsub(/\/\*\ .*\ \*\//, mark_comment)
  end

  def postcss_variables(code)
    postcss(code).gsub(/\$\((\w|\-)+\)/, mark_important)
                 .gsub(/\$(\w|\-)+/,     mark_important)
  end

  def postcss_mixins(code)
    postcss(code).gsub(/@define\-mixin/,    mark_important)
                 .gsub(/@mixin(-content)?/, mark_important)
  end

  def postcss_assets(code)
    postcss(code).gsub(/resolve/, mark_important)
                 .gsub(/inline/,  mark_important)
  end

  def postcss_use(code)
    postcss(code).gsub(/@use/, mark_important)
  end

  def postcss_flexbugs(code)
    postcss(code).gsub(/(height|min\-height)/, mark_important)
  end

  # Structure

  def directories(code)
    code.gsub(/(\/\/\ )(.*)/, '<mark class="comment">&nbsp;&nbsp;\2</mark>')
  end

  private

  def mark
    '<mark>\0</mark>'
  end

  def mark_comment
    '<mark class="comment">\0</mark>'
  end

  def mark_important
    '<mark class="important">\0</mark>'
  end
end
