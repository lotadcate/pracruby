
=begin 参考資料
https://uxmilk.jp/tag/ruby
https://railsdoc.com/ruby_base
https://docs.ruby-lang.org/ja/latest/doc/index.html
https://www.tohoho-web.com/ruby/class.html#class
=end

# puts
# 自動改行、シングルコーテーションなら特殊文字も表示
puts 123
puts "Hello World"

var = 10
puts var # 10
puts "#{var}" # 10
puts '{#var}' # {#var}

# カンマで連続表示
puts "var = ", 10
# var =
# 10

# オブジェクトの表示
puts [1,2,3]
puts nil
puts Object.new

##### 出力結果　##########
# 複数行のコメント
=begin
1
2
3
（改行）
#<Object:0x007ff133920af0>
=end

# メソッド

def メソッド名
  # やりたい処理
end

#メソッドの呼び出しはメソッド名を書くだけ

# 引数付き
def Hello(name, age)
  puts "Hello World, #{name}! You are #{age} years old!"
end

# 呼び出し
Hello("Hitoshi", 34)

#デフォルト値の指定
def Hello(name="tomochan", age)
  puts "Hello World, #{name}! You are #{age} years old!"
end

# キーワード指定 2.0以降
def hello(name:, age:)
  puts "Hello World! #{name}, #{age} years old."
end

#呼び出し
hello(name:"Atsuko", age:54)

# メソッドの戻り値
def multiple(num)
  return num*2
end

number = 3
number = multiple(number)
puts number


# ブロック構文 do-end
[1,3,7,2,5].each do |x|
  puts x
end
=begin 出力
1
3
7
2
5
=end

[1,3,7,2,5].each do {|x| puts hensu}

=begin
１行の時は do-end
複数行の時は {}
=end

# ブロック構文を使ったメソッドの生成
# https://style.potepan.com/articles/27709.html
def block
  yield
end

block do
  puts "this is block"
end

# yield に引数を渡したバージョン
def block
  yield "block"
end

block do |name|
  puts "This is " + name;
end

# 配列におけるeachメソッドのブロック構文の例
配列.each do | 変数名 |
処理
end


# クラス　ブロッック付きメソッド
class SampleEach
  def initialize(array)
    @array = array # @array インスタンス変数
  end

  def each
    i = 0
    while i < @array.length
      yield @array[i]
      i += 1
    end
  end
end

instance = SampleEach.new([1,2,3,4,5])
instance.each do |x|
  puts x
end

# これと同じ
[1,2,3,4,5].each do |x|
  puts x
end

# 見た目が同じでも違うオブジェクト
ms_suzuki = "Yoshiko"
ms_takahashi = "Yoshiko"

ms_suzuki.equal? ms_takahashi
=> false

# 同じとみなしたいなら -> シンボル
ms_suzuki = :Yoshiko
ms_takahashi = :Yoshiko

ms_suzuki.equal? ms_takahashi
=> true

=begin
「複数あっては困るもの」を指定するときに、Rubyではシンボルが積極的に使われます。
たとえばハッシュでは、各要素のキーにシンボルを使います。
=end
our_name= { :my_name => 'Ahiru', :his_name => 'Kitsune', :my_nephew => 'Yamori' }
p our_name[:my_name]
#=> "Ahiru"

# puts, print, pの違い https://qiita.com/yyykms123/items/2706d14ee4515c2ba406

# ヒアドキュメント
puts <<milkman
   hello!!
   i am milkman!!
   i like milk.
milkman
# 式展開

# 配列
names = ["田中", "佐藤", "高橋"] # names = Array["田中", "佐藤", "高橋"]とかいても同じ
puts names[0]
#=> 田中

# 繰り返し処理
cities = ["Tokyo", "Nagoya", "Osaka"]
cities.each do |x|
  puts x
end

# ハッシュ（連想配列）
# ハッシュの生成
HashObject = {Key1 => Value1, Key2 => Value2 ,...}
#ハッシュ値の取得
HashObject[Key] # HashObject.fetch(key) でもok

test = {"user" => "milkman", "food"=>"fish", "drink" => "milk"}

puts(test["user"])
puts(test.fetch("user"))

# new
HashObject = Hash.new("引数")

# ローカル変数
def p(x,y)
	foo = x + y
	puts foo
end

def m(x,y)
	foo = x - y
	puts foo
end

p(3,4)
m(3,4)
puts foo # エラー, fooはローカル

# インスタンス変数 デフォルトの値はnil
@instance_foo
=begin なぜインスタンス変数なんてものがあるのか
それは、メソッドの中だけであればローカル変数で十分ですが、
オブジェクトが複数あった場合や、
状態を持ったオブジェクトを使用する場合は
ローカル変数だけでは足りないからなのです。
=end

# クラス変数
@@class_foo = ...

# グローバル変数
$global_foo

# 定数
CONSTANT_FOO

# if 文
drink = "milk"
if drink == "coffee" then
  puts "UX_COFFEE"
elsif drink == "milk" then
  puts "UX_MILK"
else
  puts "UX_NOTINHG"
end

# if 修飾子
age = 18
puts "成人です" if age >= 18

# unless (if not)
var = "UI"
unless var == "UX" then
  puts "UNKNOWN"
end

# case文 処理の分岐 elseがデフォルト
# たとえ複数の when 節の値と一致したとしても最初に一致した when節の処理しか実行されない
color = "pink"
case color
when "green"
  puts 1
when "pink"
  puts 2
else
  puts 0
end

# if文で記述
color = "pink"
case color
if color === "green"
  puts 1
elsif color === "pink"
  puts 2
else
  puts 0
end

# cf) ==と=== の違い https://qiita.com/Siva0410/items/c0b6ed52017ffada8bf4
# == の方が縛りが強い

# 複数の条件を付与
color = "orange"
case color
when "green", "blue"
  puts 1
when "yellow", "orange"
  puts 2
when "red"
  puts 3
else
  puts 0
end # 2

# 範囲を指定
score = 65
case score
when 0..59
  puts "C"
when 60..89
  puts "B"
when 90..101
  puts "A"
else
  puts "F"
end

# クラスを指定
value = 1.4
case value
when String
  puts "str"
when Integer
  puts "int"
when Float
  puts "float"
else
  puts "type error"
end

# 正規表現
lang = "Haskell"
case lang
when /as/
  puts "AS"
when /on/
  puts "ON"
else
  puts "NOTHING!"
end # AS

# 繰り返し

# until文
until （条件式）do
  # 繰り返し実行したい処理
end

point = 1
until point > 4 do
  puts "#{point}" + "点獲得しました"
  point = point + 1
end
puts "4点獲得したのでゲームを終了します"

# until 修飾子
point = 1
point = point + 1 until point > 5
puts point

# 後置until文
point = 1
begin
  point = point + 1
      puts point
end until point > 5

# while文
point = 1
while point < 5
  puts "#{point}" + "点獲得しました"
  point = point + 1
end

# while 修飾子
point = 1
point = point + 1 while point < 5

# 後置while文
point = 1
begin
  point = point + 1
      puts point
end while point < 5

# for文
drink = ['MILK', 'COFFEE', "WATER"]
for uxname in drink
  puts "UX" + uxname
end

# 多重代入
drink = {:MILK => "牛乳", :COFFEE => "コーヒー", :WATER => "水"}
for uxname_en, uxname_jp in drink
  puts "UX" + "#{uxname_en}"
  puts "ユーザエクスペリエンス" + "#{uxname_jp}"
end


  