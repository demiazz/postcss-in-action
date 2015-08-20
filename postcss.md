# PostCSS in Action

[Алексей Плуталов](https://github.com/demiazz/), [Злые Марсиане](https://evilmartians.com/)

## **PostCSS in Action**
!type is-title
!image logo.svg

*Алексей Плуталов, Злые Марсиане*

##
!type with-martians

!image martians.svg

## Работал над
!type with-clients

!image ebay.svg
!image idinaidi.png
!image amplifr.png

## Проблема
!type shout

!cover beginning.jpg

## *Проблема* Эволюция
!type with-evolution

!image evolution.jpg

## *Проблема* Новые технологии
!type with-html5

!image html5.svg

## *Проблема* Новые инструменты
!type with-sass-compass

!image sass-compass.jpg

## *Проблема* Застой развития
!type with-evolution

!image bad-evolution.png

## *Проблема* Новые идеи
!type with-article

!image tj.jpg

<a href="http://tjholowaychuk.tumblr.com/post/44267035203/modular-css-preprocessing-with-rework">Modular CSS preprocessing with rework</a>
<cite><br><a href="https://twitter.com/tjholowaychuk">@tjholowaychuk</a>, Февраль 2013</cite>

## PostCSS
!type shout

!cover postcss.jpg

## *PostCSS* Препроцессоры
!type with-preprocessor-scheme

!image preprocessor-scheme.svg

## *PostCSS* Схема работы
!type with-postcss-scheme

!image postcss-scheme.svg

## *PostCSS* Платформа
!type with-postcss

!image postcss.svg

## *PostCSS* Не только постпроцессор
!type with-precss

!image precss.svg

## *PostCSS* Не только трансформирует

Например, [stylelint]:

```css
#bad-selector {
  background: red;
}
```

```none
Unexpected id selector (selector-no-id) [stylelint]
```

[stylelint]: http://stylelint.io/

## *PostCSS* Не только расширение CSS

```postcss
$background-color: red;

body {
  background: $background-color;
}
```

## PostCSS и препроцессоры
!type shout

!cover preprocessors.jpg

## *PostCSS и препроцессоры* Работают вместе
!type with-pre-post

!image pre-post.svg

## *PostCSS и препроцессоры* Модульность
!type with-modularity

!image modularity.svg

## *PostCSS и препроцессоры* Поддержка

<table>
  <tr>
    <th>Плагин</th>
    <th>Строк кода</th>
  </tr>
  <tr>
    <td>postcss-simple-vars</td>
    <td>92</td>
  </tr>
  <tr>
    <td>postcss-mixins</td>
    <td>186</td>
  </tr>
  <tr>
    <td>postcss-nested</td>
    <td>73</td>
  </tr>
</table>

## *PostCSS и препроцессоры* Производительность

<div class='chart chart_performance'></div>

## PostCSS уже здесь
!type shout

!cover there.jpg

## *PostCSS уже здесь* Autoprefixer
!type with-autoprefixer

!image autoprefixer.svg

## *PostCSS уже здесь* Большие игроки
!type with-companies

!image logos/google.svg
!image logos/taobao.svg
!image logos/wordpress.svg
!image logos/twitter.svg
!image logos/ok.svg
!image logos/vk.svg

## *PostCSS уже здесь* Количество загрузок

<div class='chart chart_downloads'></div>

## Интеграция
!type shout

!cover integration.jpg

## *Интеграция* Ручной вызов

```js
import postcss from 'postcss';

postcss([ plugin1, plugin2 ])
  .process(css)
  .then( result => console.log(result.css) );
```

## *Интеграция* Интеграция с Gulp

```js
gulp.task('css', () => {
  return gulp.src('./components/**/*.css')
    .pipe(postcss([
      autoprefixer({ browsers: [ 'last 2 versions' ] }),
      cssnano
    ])
    .pipe(gulp.dest('./dest'));
});
```

## *Интеграция* Интеграция с Webpack
!type with-small-code

```js
export default {
  module: {
    loaders: [ {
      test:   /\.css$/,
      loader: 'style-loader!css-loader!postcss-loader'
    } ]
  },
  postcss () {
    return [ autoprefixer({ browsers: [ 'last 2 versions' ] }),
             cssnano ];
  }
}
```

## *Интеграция* [postcss-use]

```postcss_use
@use postcss-circle;

.circle {
  circle: 100px red;
}
```

[postcss-use]: https://github.com/postcss/postcss-use

## Внедрение в проект
!type shout

!cover project.jpg

## *Внедрение в проект* Проект без PostCSS

```js
.pipe(less())
.pipe(postcss([
  require('autoprefixer-core'),
  require('cssnext'),
  require('cssnano')
])
```

## *Внедрение в проект* Новый проект

```js
.pipe(postcss([
  require('precss'),
  require('autoprefixer-core'),
  require('cssnano')
])
```

## *Внедрение в проект* [PreCSS]
!type with-smaller-code
!type with-2-codes

```postcss
$small-width: 960px;
$large-width: calc($small-width + 1px);

@custom-media --small (max-width: $small-width);
@custom-media --large (min-width: $large-width);

.cards {
  @media (--small) {
    width: auto;
  }

  &&_narrow {
    @media (--large) {
      width: $small-width;
    }
  }
}
```

```css
@media (max-width: 960px) {
  .cards {
    width: auto;
  }
}

@media (min-width: 961px) {
  .cards.cards_narrow {
    width: 960px;
  }
}
```

[PreCSS]: https://github.com/jonathantneal/precss

## Переменные
!type shout

!cover variables.jpg

## *Переменные* [postcss-simple-vars]

```postcss_variables
@import 'config/icons.css';

.icon {
  &_small  { size: $icon-s-size; }
  &_medium { size: $icon-m-size; }
  &_large  { size: $icon-l-size; }
}
```

[postcss-simple-vars]: https://github.com/postcss/postcss-simple-vars

## *Переменные* Конфигурация в JavaScript

```js
import sizes from 'config/icons';

export default simpleVars({
  'icon-s-size': toPx(sizes.small),
  'icon-m-size': toPx(sizes.medium),
  'icon-l-size': toPx(sizes.large)
});
```

## *Переменные* Миксины и плагины

```js
import step from 'config/step';

postcss.plugin('postcss-default-step', () => {
  /* реализация плагина */
});
```

## *Переменные* Клиентский код

```js
import screen from 'config/screen';

const DesktopOnlyMixin = {
  /* реализация миксина для React */
};
```

## Миксины
!type shout

!cover mixins.jpg

## *Миксины* [postcss-define-property]
!type with-2-sides
!type with-medium-code

```postcss
size: $height $width {
  height: $height;
  width: $width;
}

size: $size {
  height: $size;
  width: $size;
}
```

```postcss
.rectangle {
  size: 50px 100px;
}

.square {
  size: 50px;
}
```

[postcss-define-property]: https://github.com/daleeidd/postcss-define-property

## *Миксины* [postcss-mixins]
!type with-small-code
!type with-2-sides

```postcss_mixins
@define-mixin icon $name {
  .icon.icon_$(name) {
    background: url(icons/$(name).svg);
    @mixin-content;
  }
}

@mixin icon twitter {
  width:  16px;
  height: 16px;
}
```

```css
.icon.icon_twitter {
  background: url(icons/twitter.svg);
  width:      16px;
  height:     16px;
}
```

[postcss-mixins]: https://github.com/postcss/postcss-mixins

## *Миксины* Реализация на JavaScript
!type with-small-code
!type with-2-sides

```js
require('postcss-mixins')({
  mixins: {
    clearfix () {
      return {
        '&::after': {
          content: '""';
          display: 'table';
          clear:   'both';
        }
      };
    }
  }
});
```

```postcss
.column {
  @mixin clearfix;
}

.column::after {
  content: "";
  display: table;
  clear:   both;
}
```

## *Миксины* Реализация как функции

```js
require('postcss-mixins')({
  mixins: {
    mixinName (mixinAST, ...mixinArgs) {
      /* реализация миксина */
    }
  }
});
```

## *Миксины* Миксины в PostCSS
[Кастомные свойства](https://github.com/daleeidd/postcss-define-property) &nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp; [Миксины](https://github.com/postcss/postcss-mixins) &nbsp;&nbsp;&nbsp;&nbsp;&rarr;&nbsp;&nbsp;&nbsp;&nbsp; [Плагины](http://postcss.parts/)

```postcss
.example {
  size: 10px 20px;     /* Кастомное свойство */
  @mixin icon twitter; /* Миксин */
  clear: fix;          /* Плагин */
}
```

## Скажем каскаду "Нет!"
!type shout

!cover cascad.jpg

## *Скажем каскаду "Нет!"* [postcss-bem]
!type with-small-code
!type with-2-sides

```postcss
@component button {
  font-size: 12px;

  @modifier large {
    font-size: 16px;
  }

  @descendent icon {
    margin-right: 6px;
  }
}
```

```css
.button {
  font-size: 12px;
}

.button_large {
  font-size: 16px;
}

.button__icon {
  margin-right: 6px;
}
```

[postcss-bem]: https://github.com/ileri/postcss-bem

## *Скажем каскаду "Нет!"* [postcss-bem-linter]

```css
/* @define Button */

.Button             { }
.Button--large      { }
.Button-icon        { }
.Button.is-disabled { }
```

[postcss-bem-linter]: https://github.com/postcss/postcss-bem-linter

## *Скажем каскаду "Нет!"* [CSS Modules]

```css
.className {
  color: green;
}
```

```js
import styles from './style.css';

return `<div class="${ styles.className }">`;
```

[CSS Modules]: https://github.com/css-modules/css-modules

## *Скажем каскаду "Нет!"* [react-easy-style]
!type with-smaller-code
!type with-2-sides

```css
:local .Button {
  font-size: 12px;

  &:focus {
    box-shadow: 0 0 1px 5px #999;
  }

  /* className--propsKey-propsValue */

  &--kind-default { }
  &--kind-success { }
  &--kind-warning { }
}
```

```js_css_modules
import css from './button.css';

@EasyStyle(css)
class Button extends React.Component {
  static defaultProps = {
    kind: 'default'
  }

  render () {
    return (
      <button>{ this.props.label }</button>
    );
  }
}
```

[react-easy-style]: https://github.com/maxguzenski/react-easy-style

## Будущее уже здесь
!type shout

!cover future.jpg

## *Будущее уже здесь* [cssnext]
!type with-medium-code

```postcss
:root {
  --mainFontSize: 12px;
}

@custom-selector :--button button, .button

:--button {
  font-size: var(--mainFontSize);
}
```

[cssnext]: http://cssnext.io/

## *Будущее уже здесь* [flexbugs] и [postcss-flexbugs-fixes]
!type with-2-sides

```postcss_flexbugs
div {
  display: flex;
  min-height: 50vh;
}
```

```postcss_flexbugs
div {
  display: flex;
  height: 50vh;
}
```

[flexbugs]: https://github.com/philipwalton/flexbugs
[postcss-flexbugs-fixes]: https://github.com/luisrudge/postcss-flexbugs-fixes

## Зависимости
!type shout

!cover dependencies.jpg

## *Зависимости* [postcss-import]
!type with-medium-code

```postcss
@import 'normalize.css/normalize';
@import 'mobile/index.css' (max-width: 25em);
```

```css
/* содержимое './node_modules/normalize.css/normalize.css' */

@media (max-width: 25em) {
  /* содержимое mobile/index.css */
}
```

[postcss-import]: https://github.com/postcss/postcss-import

## *Зависимости* [postcss-url]

```css
.icon    { background: url(small-image.png); }
.backing { background: url(large-image.png); }
```

```css
.icon    { background: url(data:image/png;base64,...); }
.backing { background: url(/assets/large-image.png); }
```

[postcss-url]: https://github.com/postcss/postcss-url

## *Зависимости* [postcss-font-magician]
!type with-2-sides

```css
body {
  font-family: 'Roboto';
}
```

```css
@font-face {
  /* определение Roboto */
}

body {
  font-family: 'Roboto';
}
```

[postcss-font-magician]: https://github.com/jonathantneal/postcss-font-magician

## *Зависимости* [webpcss]

```css
.icon { background-image: url(images/icon.png); }
```

```css
.icon       { background-image: url(images/icon.png); }
.webp .icon { background-image: url(images/icon.webp); }
```  

[webpcss]: https://github.com/lexich/webpcss

## Сжатие
!type shout

!cover compression.jpg

## *Сжатие* [clean-css]
!type with-clean-css

!image clean-css.svg

[clean-css]: https://github.com/jakubpawlowicz/clean-css

## *Сжатие* [cssnano]
!type with-cssnano

!image cssnano.svg

[cssnano]: http://cssnano.co/

## Организация кода
!type shout

!cover directories.jpg

## *Организация кода* Структура директорий
!type with-directories
!type with-medium-code

```directories
/postcss
  |- /config
  |- /mixins
  |- index.js     // экспорт сконфигурированного списка плагинов
  |- media.js     // экспорт кастомных медиавыражений
  |- mixins.js    // экспорт миксин
  |- utils.js     // вспомогательные функции
  |- variables.js // экспорт переменных
```

## *Организация кода* Структура тестов
!type with-directories
!type with-medium-code

```directories
/test
  |- /fixtures
  |    |- postcss
  |- /postcss
  |    |- /config
  |    |- /mixins
  |    |- index.js       // тесты экспорта плагинов
  |    |- integration.js // тесты интеграции между плагинами
```

## Вопросы
!type shout
!type is-questions

!cover questions.jpg

## <a class="github" href="http://github.com/postcss/postcss">github.com/<strong>postcss</strong>/<strong>postcss</strong></a>
!type with-links

* Презентация: [demiazz.github.io/postcss-in-action](http://demiazz.github.io/postcss-in-action/)
* Github: [github.com/demiazz](https://github.com/demiazz)
* Twitter: [@demiazz](https://twitter.com/demiazz)
* [evilmartians.com](https://evilmartians.com/) / [@evilmartians](https://twitter.com/evilmartians)
* Нам нужны фронты!

!image martians.svg
