# Пример презентации

---

## Слайды в Markdown

Следует использовать заголовок второго уровня `## ...` для названий слайдов.
Сами слайды в markdown отделяются строкой `---`.

---

## Картинки

Они добавляются в слайд обычным синтаксисом Markdown: `![Текст](URL)`

![External Image](https://s3.amazonaws.com/static.slid.es/logo/v2/slides-symbol-512x512.png)

---

## Ссылки

Тоже делаются обычным синтаксисом: `[Текст](URL)`. Ссылаться можно и на другие
слайды. [Ссылка на следующий слайд](https://www.youtube.com/watch?v=dQw4w9WgXcQ).

---

## Вертикальные слайды

Помимо обычных слайдов, их можно располагать вертикально. В таком случае их
нужно разделять строкой `--`.

Для `reveal.js` добавлено несколько плагинов. Рассмотрим их через вертикальные
слайды. Можно нажимать стрелки вверх и вниз. В следующих слайдах после этой
группы также используется вертикальное расположение, поэтому дальше тоже нужно
будет тыкать вниз.

--

## zoom.js

Внутри презентации можно использовать зум. Для этого нужно нажать на `alt`
(`ctrl` на linux) и ткнуть курсором куда надо. Если сделать это ещё раз, то
зум выключится.

--

## notes.js

Для презентаций есть удобный _Presenter mode_, который включается на кнопку
`S`. В режиме презентации можно оставлять для себя заметки, которые будут видны
только в нём. Для этого можно использовать префикс `Note:`. В таком случае
весь дальнейший текст будет записываться в заметку слайда.

Note: Моя длинная
многострочная заметка

И ещё один абзац в заметке.

--

## math.js

Есть поддержка отрисовки формул с помощью KaTeX. Здесь используется синтаксис
```
`\[\alpha = \beta^2\]` <-- заметьте обратные кавычки, как при создании блока кода
```

`\[\alpha = \beta^2\]`

--

## highlight.js

Подсветка синтаксиса также присутствует. Создаётся обычным синтаксисом Markdown.
Название языка можно указать после начала блока кода.

```rust
fn main() {
  println!("Привет, Клубы!");
}
```

---

## Ещё про блоки кода

На блоках кода я бы хотел немного остановиться. Есть довольно интересная фича,
которая может быть очень полезной во время презентации. Если нужно обратить
внимание на какие-то строчки или кусок кода, то это можно сделать с помощью
дополнительных меток после названия языка.

```
```rust [|1,2|4,8-12|20,23]
#[derive(Subcommand)]
enum Commands {
      /// Initialize repo with optional section, description or owner
      Init {
```

--

Таким образом получим достаточно прикольные анимации. Замечу, что первый символ
`|` нужен был для того, чтобы начать с полностью подсвеченного кода.

```rust [|1,2|4,8-12|20,23]
#[derive(Subcommand)]
enum Commands {
      /// Initialize repo with optional section, description or owner /// Initialize repo with optional section, description or owner
      Init {
        /// Name of the new repo (this should be unique)
        #[arg(long)]
        name: String,
        /// Section of the repo (used in cgit)
        #[arg(long, default_value = "", num_args = 1..)]
        section: Vec<String>,
        /// Detailed description of the repo
        #[arg(long, default_value = "", num_args = 1..)]
        description: Vec<String>,
        /// Owner of the repo (used in gitweb or cgit)
        #[arg(long, default_value = "", num_args = 1..)]
        owner: Vec<String>,
    },
      /// Rename repo
      Rename {
        /// Name of the repo to be renamed
        #[arg(long)]
        oldname: String,
        /// New name of the repo (should be unique)
        #[arg(long)]
        newname: String,
    },
      /// Remove repo
      Remove {
        /// Name of the repo to be removed
        #[arg(long)]
        name: String,
    },
      /// Change section, description or owner of a given repo
      Change {
```

---

## Ещё анимации

Также тут можно сделать красивые переходы между изменёнными блоками кода. Для
этого нужно оставить пустым список подсвечиваемых строк и добавить комментарий
после блока кода:
```html
<!-- .element: data-id="code-animation" -->
```

`data-id` может быть любым. Оно нужно для отличия отдельных анимаций, которые
идут подряд.

--

## Ещё анимации

А в начало слайда добавить другой комментарий:
```html
<!-- .slide: data-auto-animate -->
```

--
<!-- .slide: data-auto-animate -->

## Ещё анимации


```rust []
fn main() {
  ...
}
```
<!-- .element: data-id="code-animation" -->

--
<!-- .slide: data-auto-animate -->

## Ещё анимации

```rust []
fn print_hello() {
  println!("Привет, Клубы!");
}

fn main() {
  print_hello();
}
```
<!-- .element: data-id="code-animation" -->

---

## Цитаты

Их можно использовать двумя способами. Встроенными с помощью тега `<q>...</q>`:
<q>Какая-то цитата</q>, а также блочными (смотри в код этой презентации):

> For years there has been a theory that millions of monkeys typing at random
> on millions of typewriters would reproduce the entire works of Shakespeare.
> The Internet has proven this theory to be untrue.

---

## Списки

Бывают неупорядоченными

- hello
- hello
- hello
- hello

--

## Списки

А так же упорядоченными

1. hello
1. hello
1. hello
1. hello

Делается обычным синтаксисом Markdown.

--

## Списки

Также можно анимировать, если добавить комментарии к элементам

```markdown
- hello <!-- .element: class="fragment" data-fragment-index="0" -->
- hello <!-- .element: class="fragment" data-fragment-index="1" -->
- hello <!-- .element: class="fragment" data-fragment-index="2" -->
- hello <!-- .element: class="fragment" data-fragment-index="3" -->
```

--

## Списки

- hello <!-- .element: class="fragment" data-fragment-index="0" -->
- hello <!-- .element: class="fragment" data-fragment-index="1" -->
- hello <!-- .element: class="fragment" data-fragment-index="2" -->
- hello <!-- .element: class="fragment" data-fragment-index="3" -->

От порядка индексов зависит когда появится конкретный элемент.

--

## Списки

Есть ещё в виде таблиц

| Колонка 1 | Колонка 2 |
|-----------|-----------|
| 1         | 2         |
