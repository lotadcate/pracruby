# person1 と person2 同じ
person1 = {:name => "後藤", :kana => "ゴトウ"}
person2 = {name: "後藤", kana: "ゴトウ"}

=begin #ハッシュはキーをちゃんとハッシュにしないとエラーになる
>> address = {name: "takahashi", age:43}
=> {:name=>"takahashi", :age=>43}
>> address[:name]
=> "takahashi"
>> address[name]
Traceback (most recent call last):
        4: from /usr/bin/irb:23:in `<main>'
        3: from /usr/bin/irb:23:in `load'
        2: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):7
NameError (undefined local variable or method `name' for main:Object)
=end

# "#{hoge}" は　文字列の中に組み込みたい時

# 正規表現
/パターン/ =~ マッチングしたい文字列
# => マッチ部分の位置の先頭のindex (0-indexed)
# なければ nil

# ARGVで　コマンドラインの情報をデータとして受け取る

# 別ファイルの取り込み
require "hello" # hello.rb を取り込む
require_relative
# 違い https://zenn.dev/yukito0616/articles/e2f4b2ef94535d


=begin
メソッドの分類　
インスタンスメソッド
p 100.to_s => "100"
p [1, 2, 3, 4].index(2) => 3 # 2は3番目

クラスメソッド
Array.new
File.open("some_file")
Time.now

関数的メソッド
print "hello!"
sleep(10)

=end

def hello(name="Ruby")
    puts "hello, #{name}"
end

# クラスを作る
class HelloWorld
    def initialize(myname = "Ruby") # newメソッドによって呼ばれるメソッド
        @name = name
    end

    def hello
        puts "Hello, world. I am #{@name}."
    end
end
Bob = HelloWorld.new("Bob")
Bob.hello
