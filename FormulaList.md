# z80oolong/mutt に含まれる Formula 一覧

## 概要

本文書では、 [Linuxbrew][BREW] 向け Tap リポジトリ z80oolong/mutt に含まれる Formula 一覧を示します。各 Formula の詳細等については ```brew info <formula>``` コマンドも参照して下さい。

## Formula 一覧

### z80oolong/mutt/mutt

Unicode の規格における東アジア圏の各種文字のうち、いわゆる "◎" や "★" 等の記号文字及び罫線文字等、 [East_Asian_Width 特性の値が A (Ambiguous) となる文字][EAWA] (以下、 [East Asian Ambiguous Character][EAWA]) が、日本語環境で文字幅を適切に扱うことが出来ずに表示が乱れる問題を修正した [mutt][MUTT] のうち、最新の安定版及び HEAD 版を導入するための Formula です。

即ち、この Formula は、 [mutt][MUTT] に、 "[East Asian Ambiguous Character を全角文字の幅で表示する差分ファイル][GST1]" を適用したものを導入します。

### z80oolong/mutt/mutt@1.9

この Formula は、旧安定版である [mutt 1.9.5][MUTT] に、 "[East Asian Ambiguous Character を全角文字の幅で表示する差分ファイル][GST1]" を適用したものを導入します。

**この Formula は、 versioned formula であるため、この Formula によって導入される [mutt][MUTT] は、 keg only で導入されることに留意して下さい。**

この Formula によって導入される [mutt][MUTT] を使用するには、 ```brew link --force z80oolong/mutt/mutt@1.9``` コマンドを実行する必要があります。

### z80oolong/mutt/mutt@1.10

この Formula は、旧安定版である [mutt 1.10.1][MUTT] に、 "[East Asian Ambiguous Character を全角文字の幅で表示する差分ファイル][GST1]" を適用したものを導入します。

**この Formula は、 versioned formula であるため、この Formula によって導入される [mutt][MUTT] は、 keg only で導入されることに留意して下さい。**

この Formula によって導入される [mutt][MUTT] を使用するには、 ```brew link --force z80oolong/mutt/mutt@1.10``` コマンドを実行する必要があります。

### z80oolong/mutt/mutt@1.11

この Formula は、旧安定版である [mutt 1.11.2][MUTT] に、 "[East Asian Ambiguous Character を全角文字の幅で表示する差分ファイル][GST1]" を適用したものを導入します。

**この Formula は、 versioned formula であるため、この Formula によって導入される [mutt][MUTT] は、 keg only で導入されることに留意して下さい。**

この Formula によって導入される [mutt][MUTT] を使用するには、 ```brew link --force z80oolong/mutt/mutt@1.11``` コマンドを実行する必要があります。

<!-- 外部リンク一覧 -->

[BREW]:https://linuxbrew.sh/
[MUTT]:http://www.mutt.org/
[EAWA]:http://www.unicode.org/reports/tr11/#Ambiguous
[GST1]:https://github.com/z80oolong/mutt-eaw-fix/
