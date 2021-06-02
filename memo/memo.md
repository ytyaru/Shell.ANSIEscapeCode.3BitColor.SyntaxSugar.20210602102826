# color3

　[ANSI Escape Code][]における3bit/4bitカラーの糖衣構文を実装する。

# 情報源

* [ANSI Escape Code][]

[ANSI Escape Code]:https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_(Select_Graphic_Rendition)_parameters

* [ターミナルの色数を設定する（`toe -a`, `tput colors`, `${TERM}`）](http://ytyaru.hatenablog.com/entry/2020/05/26/000000)

# 装飾について

tools|概要
-----|----
color|色をつける
decoration|装飾する
position|位置を管理する（開始位置、幅と高さ、スクロール）

# color

## 出力値

　以下の３パターンが考えられる。応用性からして`\e[31m`の形式がよい。

* `\e[31m`
* `\e[31m引数\e[m`
* `\e[31m引数\e[m\n`

　装飾は複数にわたって出力されることがある。このとき`;`で区切られる。色のほかにも太字やイタリックなど様々な装飾がある。これらは別のツールによって出力させたい。よってそれらと連携するためにも、本ツールは`31`など色コードのみ出力し、前後のコード部分を排除したものがよい。

* `\e[1;31;m`

　ただ、色だけにおいても文字色と背景色の両方を指定することがある。よって本ツールは`31;46`など色コード部分の連結だけは対応する。

* `\e[31;46m`

　つぎのように入出力する。

```sh
$color3 0
30
$color3 7
37
$color3 k
30
$color3 black
30
$color3 -f 0
30
$color3 -F 1
91
$color3 -b 2
42
$color3 -B 3
103
$color3 1 2
31;42
$color3 r g
31;42
$color3 red green
31;42
$color3 -F 1 -B 2
91;102
$color3 -F r -B g
91;102
$color3 -F red -B green
91;102
```

