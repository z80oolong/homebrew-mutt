# z80oolong/mutt -- East Asian Ambiguous Character を全角文字の幅で表示する mutt を導入するための Formula 群

## 概要

[Linuxbrew][BREW] とは、Linux の各ディストリビューションにおけるソースコードの取得及びビルドに基づいたパッケージ管理システムです。 [Linuxbrew][BREW] の使用により、ソースコードからのビルドに基づいたソフトウェアの導入を単純かつ容易に行うことが出来ます。

この [Linuxbrew][BREW] 向け Tap リポジトリは、電子メール送受信ソフトウェアである [mutt][MUTT] において、 Unicode の規格における東アジア圏の各種文字のうち、いわゆる "◎" や "★" 等の記号文字及び罫線文字等、 [East_Asian_Width 特性の値が A (Ambiguous) となる文字][EAWA] (以下、 [East Asian Ambiguous Character][EAWA]) が、日本語環境で文字幅を適切に扱うことが出来ずに表示が乱れる問題を修正するための差分ファイルを適用した [mutt][MUTT] を導入するための Formula 群を含む Tap リポジトリです。

即ち、この Tap リポジトリに含まれる Formula は、電子メール送受信ソフトウェアである [mutt][MUTT] に、 "[East Asian Ambiguous Character を全角文字の幅で表示する差分ファイル][GST1]" を適用したものを導入します。

## 使用法

まず最初に、以下に示す Qiita の投稿及び Web ページの記述に基づいて、手元の端末に [Linuxbrew][BREW] を構築し、以下のように  ```brew tap``` コマンドを用いて本リポジトリを導入します。

- [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" の投稿
- [Linuxbrew の公式ページ][BREW]

そして、本リポジトリに含まれる Formula を以下のようにインストールします。

```
 $ brew tap z80oolong/tmux
 $ brew install <formula>
```

なお、一時的な手法ですが、以下のようにして URL を直接指定してインストールすることも出来ます。

```
 $ brew install https://raw.githubusercontent.com/z80oolong/homebrew-tmux/master/Formula/<formula>.rb
```

なお、本リポジトリに含まれる Formula の一覧及びその詳細については、本リポジトリに同梱する ```FormulaList.md``` を参照して下さい。

## その他詳細について

その他、本リポジトリ及び [Linuxbrew][BREW] の使用についての詳細は ```brew help``` コマンド及び  ```man brew``` コマンドの内容、若しくは [Linuxbrew の公式ページ][BREW]を御覧下さい。
## 謝辞

まず最初に下記に示すところの、電子メール送受信ソフトウェアである [mutt 1.5.23][MUTT] に対応する [East Asian Ambiguous Character][EAWA] の幅を漢字や全角カナ文字等と同じ幅 2 で表示する為の差分ファイル及び [mutt 1.5.23][MUTT] 対応の各種機能拡張の為の差分ファイルを作成された、[滝澤隆史氏][TKZW]及び[吉田行範氏][YOSH]に心より感謝致します。

そして、 [mutt][MUTT] の日本語化対応に尽力して下さった全ての方々に心より感謝致します。

- [patch-1.5.23.tt.wcwidth.1.gz][PAT1]
- [patch-1.5.23.tt.cjk_width_tree_chars.1.gz][PAT2]
- [patch-1.5.23.tt.create_rfc2047_params.1.gz][PAT3]
- [patch-1.5.23.tt.sanitize_ja_char.1.gz][PAT4]
- [patch-1.5.23.tt+yy.delete_prefix.1.gz][PAT5]

最後に [mutt][MUTT] の最初の開発者である [Michael Elkins 氏][MELK]及びその他の [mutt][MUTT] の開発者の各氏を始め、 [mutt][MUTT] に関する全てのことに関わった全ての方々及び、 [Linuxbrew][BREW] に関わる全ての皆様に心より感謝致します。

## 使用条件

本リポジトリは、 [Linuxbrew][BREW] の Tap リポジトリの一つとして、 [Linuxbrew の開発コミュニティ][BREW]及び [Z.OOL. (mailto:zool@zool.jpn.org)][ZOOL] が著作権を有し、[Linuxbrew][BREW] のライセンスと同様である [BSD 2-Clause License][BSD2] に基づいて配布されるものとします。詳細については、本リポジトリに同梱する ```LICENSE``` を参照して下さい。

<!-- 外部リンク一覧 -->

[BREW]:https://linuxbrew.sh/
[MUTT]:http://www.mutt.org/
[EAWA]:http://www.unicode.org/reports/tr11/#Ambiguous
[GST1]:https://github.com/z80oolong/mutt-eaw-fix/
[THER]:https://qiita.com/thermes
[THBR]:https://qiita.com/thermes/items/926b478ff6e3758ecfea
[TKZW]:https://twitter.com/ttkzw
[YOSH]:mailto:yyo@pjs.nevt.nec.co.jp
[PAT1]:https://emaillab.jp/pub/mutt/1.5/patch-1.5.23.tt.wcwidth.1.gz?x27017
[PAT2]:https://emaillab.jp/pub/mutt/1.5/patch-1.5.23.tt.cjk_width_tree_chars.1.gz?x27017
[PAT3]:https://emaillab.jp/pub/mutt/1.5/patch-1.5.23.tt.create_rfc2047_params.1.gz?x27017
[PAT4]:https://emaillab.jp/pub/mutt/1.5/patch-1.5.23.tt.sanitize_ja_char.1.gz?x27017
[PAT5]:https://emaillab.jp/pub/mutt/1.5/patch-1.5.23.tt+yy.delete_prefix.1.gz?x27017
[MELK]:mailto:me@cs.hmc.edu
[BSD2]:https://opensource.org/licenses/BSD-2-Clause
[ZOOL]:http://zool.jpn.org/
