import 'package:flutter/material.dart';
import 'dart:math';

void dartGrammar() {
    //一. Dart 重要概念
    //1.所有的变量都是对象, 每个对象都是一个类的实例, 即使 numbers, functions, null 都是对象. 所有的对象都继承自 Object
    //2.尽管 Dart 是强类型的, 类型声明是可选的因为 Dart 可以进行类型推断. 不确定的类型可以使用 dynamic
    //3.Dart 支持泛型,  比如 List<int>, List<dynamic>
    //4.Dart 支持 top-level 函数(例如 main()), 也支持 static method(class method) 和 instance method(object method).也可以使用嵌套函数
    //5.类似的 Dart 支持 top-level 变量, 以及 static variable 和 instance variable. instance variable 有时也被称为 fields 或 properties
    //6.和 Java 不同, Dart 没有 public, protected, private 关键字. 如果一个 identifier 以下划线开头, 则对于它的 library 它是 private
    //7.identifier 以字母或下划线开头, 后面跟数字或字母
    //8.Dart expressions(表达式, 有 runtime values)和 statements(语句, 没有 runtime values). 例如条件表达式 (condition ? expr1 : expr2)
    //有一个值 expr1 或 expr2. if-else 语句没有.语句里可以有表达式, 表达式里不能有语句
    //9.Dart 有 warnings 和 errors

    //二. 关键字
    //部分关键字可以有条件使用

    //三. 变量
    //1.类型
    //不需要写类型, 会根据初始值类型推断
    var name = 'Bob';
    //不限定类型使用  Object 或 dynamic
    dynamic perName = 'Bob';
    Object obName = 'aba';
    //指定类型, 类型写在前面
    String boyName = 'boa';

    //默认值
    //没有初始化的变量默认为 null
    int lineCount;
    assert(lineCount == null);

    //2. final, const
    //常量使用 final 或 const, const 是编译时常量.(Const variables are implicitly final.)
    //Instance variable 只能用 final 不能用 const. final instance variable 在构造体开始前必须赋值
    final gender = 'boy';
    final String nickname = 'tom';

    //const 用于 compile-time constants, class 常量使用 static const
    const studentname = 'lili';
    const double atm = 10.0;

    //const 不仅可以用来声明 const variable(常量)也可以用来创造 const values (常量值)
    var foo = const [];
    final bar = const [];
    //常量声明的初始化表达式可以省略 const
    const baxz = []; // const baxz = const []
    //non-final, non-const variable 的值可以改变, 即使它的值为 const value
    foo = [1, 2, 3];

    //四. 内置类型
    //Dart 支持 numbers, strings, booleans, lists(arrays), maps, runes(for expressing Unicode characters in a string), symbols
    //1.Numbers
    //Dart 中 numbers 有两种形式: int, double
    //int 和 double 都是 num 的子类型. num 类型包括基本运算符例如 +, -, /, * 以及一些函数 abs(), ceil(), floor(), Bitwise operators等
    //int
    int x = 1;
    int hex = 0xDEDBEEF;
    //double
    double y = 1.1;
    double exponents = 1.42e5;

    //2.类型转换
    //String -> int
    var one = int.parse('1');
    //String -> double
    var onePointOne = double.parse('1.1');
    //int -> String
    var oneAsString = 1.toString();
    //double -> String
    var piAsString = 3.1415926.toString();

    //3.int 类型的可以进行 bitwise shift(<<, >>), AND(&),  OR(|)
    var leftshift = 3 << 1; // 0011 << 1 == 0110  输出:6
    var rightshift = 3 >> 1; // 0011 >> 1 == 0001 输出:1
    var num = 3 | 4; // 0011 | 0100 == 0111 输出:7

    //4.Literal numbers 是编译时常量, 一个表达式的运算对象都是 numbers 类型的编译时常量, 那么这个表达式也是编译时常量
    const msPerSecond = 1000;
    const secondsUntilRetry = 5;
    const msUntilRetry = secondsUntilRetry * msPerSecond;

    //五. Strings
    //Dart 中 String 是 UTF-16 码序列, 可以使用单引号或双引号
    var s = 'adlkokjojj';
    //字符串中引用变量
    //在字符串中引用字符串使用 ${}, 如果表达式只是一个 identifier, {} 可以省略
    assert(
        'That deserves all caps.' + '${s.toUpperCase()} is very handy' != '');
    assert('Dart has $s' + 'which is very handy' != '');

    //字符串合成
    //两个相邻的字符串可以组成一个字符串, 或者使用 +
    var s1 = 'afadfa' 'afaf';
    var s2 = 'nadf' + 'adsf';

    //多行字符串
    // 可以每行分开写, 也可以使用 '''("""""")
    var s3 = 'string'
        'const'
        'work even';
    var s4 = '''
    you can create 
    multi-line strings like this one.
    ''';

    //You can create a “raw” string by prefixing it with r:
    var s5 = r'In a raw string, not even \n gets special treatment.';
    print(s5 +
        '*****************************'); //In a raw string, not even \n gets special treatment.

    //Literal strings 是编译时常量, 只要字符串内包含有 null, numeric, string, boolean 类型的编译时常量
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';
    const validConstString = '$aConstNum $aConstBool $aConstString';

    //错误❌
    var aNum = 0;
    var aBool = true;
    var aString = 'a string';
    const aConstList = [1, 2, 3];
    //const invalidConstString = '$aNum $aBool $aString $aConstList';

    //六. Bool
    //Dart 中 Bool 是编译时常量, Dart 是类型安全的, 因此不能使用类似 if (nonbooleanValue) 或者 assert(nonbooleanValue)
    var fullName = '';
    assert(fullName.isEmpty);

    var hitPoints = 0;
    assert(hitPoints <= 0);

    var unicorn;
    assert(unicorn == null);

    var iMeantToDoThis = 0 / 0;
    assert(iMeantToDoThis.isNaN);

    //七. Lists
    //Dart 中用 List 表示数组, 相同类型元素, 按序排列
    var list = [1, 2, 3]; //类型为: List<int>
    assert(list.length == 3);
    assert(list[1] == 2);
    list[1] = 1;
    assert(list[1] == 1);

    //创建编译时常量的 list
    var constantList = const [1, 2, 3];

    //八. Maps
    //Maps 相当于字典, key 和 value 都可以是任何类型
    var gifts = {
      'first': 'partridge',
      'second': 'turtledoves',
      'fifth': 'golden rings'
    }; // gifts 类型为 Map<String, String>

    var nobleGases = {
      2: 'helium',
      10: 'neon',
      18: 'argon'
    }; //nobleGases 类型为 Map<int, String>

    var aPer = {
      'name': 'bb',
      'age': 18,
      'weight': 180
    }; //aPer 类型为 Map<String, Object>

    //可以使用 Map 的构造方法创建 Map 对象
    var anotherGift = Map();
    anotherGift['first'] = 'partridge';
    anotherGift['second'] = 'turtledoves';
    anotherGift['fifth'] = 'golden rings';

    anotherGift['third'] = 'calling birds';
    assert(anotherGift['first'] == 'partridge');
    assert(anotherGift.length != 0);

    //创建编译时常量的 map, 在 map literal 前加 const
    final constantMap = const {
      2: 'helium',
      10: 'neon',
      18: 'argon',
    };

    //九. Runes
    //Dart 中, runes 是一个字符串的 UTF-32 码, 字符创是 UTF-16 序列,  Unicode code 的表达方式: \u{XXXX}, XXXX 是 4 位的 16进制值
    //String 有几个属性可以获取 rune 信息,  属性 codeUnitAt 和 codeUnit 返回 16 位码, runes 返回字符串的 runes
    var clapping = '\u{1f44f}';
    print(clapping); //👏
    print(clapping.codeUnits); //[55357, 56399]
    print(clapping.runes.toList()); //[128079]

    Runes input = new Runes('\u2665 \u{1f605} \u{1f47b} \u{1f596} \u{1f44d}');
    print(new String.fromCharCodes(input)); //♥ 😅 👻 🖖 👍

    //十. Symbols
    //Symbol 对象代表一����� operator 或者 identifier. 平时几乎用不到
    // Symbols are invaluable for APIs that refer to identifiers by name, because minification changes identifier names but not identifier symbols.
    //获取一个 identifier 的 symbol, 使用 #
    print(#clapping);

    //十一. Functions
    //Dart 是面向对象的语言, 所以即使是 function 也是对象, 类型为 Function. 这意味着函数可以被赋值, 做为参数.
    //1. 函数表达式
    bool isNoble(int atomicNumber) {
      return nobleGases[atomicNumber] != null;
    }

    //对于 public APIs 推荐进行类型声明, 但是可以忽略参数, 返回值的类型
    isNobleOmit(atomicNumber) {
      return nobleGases[atomicNumber] != null;
    }

    //只包含一个表达式的函数, 可以用简便写法
    bool anotherIsNoble(int atomicNumber) => nobleGases[atomicNumber] != null;

    //2. Parameters
    //函数参数有两种: required 和 optional, required 在前, optional 在后
    //Optional parameters 又分两种:
    //ooptional named parameters 或 optional positional parameters, 但不能同时是两种

    //Optional named parameters:
    //函数定义, 类型在前, 参数名在后, 中间没有冒号, 参数用 {} 括起来
    void enableFlags({bool bold, bool hidden}) {}
    //函数调用, 参数名在前, 类型在后, 中间有冒号
    enableFlags(bold: true, hidden: false);
    //Flutter中 实例创建表达式比较复杂, 所有 widget 构造器只用 named parameters, 这样更加易读
    //可以将 named parameter 标注为 @required 表明这是一个 required parameter
    void setFlags({bool bold, @required bool hidden}) => print('');
    setFlags(bold: true, hidden: false);

    //Optional positional parameters:
    //定义函数时, 用 [] 括住的参数称为 Optional positional parameters
    String say(String from, String msg, [String device]) {
      var result = '$from says $msg';
      if (device != null) {
        result = '$result with a $device';
      }
      return result;
    }

    //调用函数, 没有第三个参数
    assert(say('bob', 'howdy') == 'bob says howdy');
    //调用函数, 有第三个参数
    assert(say('bob', 'howdy', 'smoke signal') ==
        'bob says howdy with a smoke signal');

    //3.可选参数默认值
    //对于可选参数, 可以用 = 给参数赋默认值, 默认值必须是 compile-time constant, 如果没有提供默认值, 默认值为 null

    void enableStates({bool bold = false, bool hidden}) {}
    String sayHello(String from, String msg,
        [String device = 'carrier pigeon', String mood]) {
          var result = '$from says $msg';
          if (device != null) {
            result = '$result with a $device';
          }
          if (mood != null) {
            result = '$result (in a $mood mood)';
          }
          return result;
    }
    assert(sayHello('bob', 'howdy') == 'bob says howdy with a carrier pigeon');

    //参数为 List, Map
    void doStuff(
      {List<int> list = const [1, 2, 3], 
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }} ) {
        print('list: $list');
        print('gifts: $gifts');
    }

    //4.函数作为 first-class objects
    //可以将一个函数作为另一个函数的参数
    void printElement(int element) {
      print(element);
    }
    var list1 = [1, 2, 3];
    list1.forEach(printElement);
    //也可以将函数赋给变量
    var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
    assert(loudify('hello') == '!!! HELLO !!!');

    //5.匿名函数
    //Dart 匿名函数表达式: 
    /*
      ([[Type] param1[, ...]]) {
        codeBlock;
      };
    */
    var list2 = ['apples', 'bananas', 'oranges'];
    list2.forEach((item) {
      print('${list2.indexOf(item)}: $item');
    });
    //如果函数只有一个语句, 可以用箭头简写
    list2.forEach((item) => print('${list2.indexOf(item)}: $item'));
    
    //十二. Lexical scope(语义范围)
    //Dart 是一个语义有范围的语言, 这意味这变量的范围是静态决定的.
    bool topLevel = true;
    void anotherFunc() {
      var insideMain = true;
      void myFunction() {
        var insideFunction = true;
        void nestedFunction() {
          var insideNestedFunction = true;
          assert(topLevel);
          assert(insideMain);
          assert(insideFunction);
          assert(insideNestedFunction);
        }
      }
    }
    
    //Lexical closures(语义闭包)
    //闭包可以捕捉变量
    Function makeAdder(int addBy) {
      return (int i) => addBy + i;
    }
    var add2 = makeAdder(2);
    var add4 = makeAdder(4);
    print(add2(3));
    print(add4(3));
    
    //测试函数是否相等
    //以下是比较 top-level 函数, static 方法, instance 方法是否相等的例子:
    // void foo1() {} //top-level 函数
    // class A {
    //   static void bar() {} //static 方法
    //   void baz() {} //instance 方法
    // }
    var xValue;
    xValue = foo1;
    assert(foo1 == xValue);

    xValue = A.bar;
    assert(A.bar == xValue);

    var v = A();
    var w = A();
    var yz = w;
    xValue = w.baz;

    //十三. 返回值
    //所有函数都有返回值, 没有的返回 null
    food() {}
    assert(food() == null);

    //十四. 运算符
    //Dart 中的运算符可以重写, 注意优先级
    //1. 数学运算符
    //+, -, *, /, ~/(除, 整数部分), %(除, 余数部分) 
    assert(2 + 3 == 5);
    assert(2 - 1 == 1);
    print('${2 + 3} - 4' == '${2 - 1}');

    //2. ++var, var++, --var, var--
    var a, b;
    a = 0;
    b = ++a;//先自增, 再赋值
    assert(a == b);// 1 == 1

    a = 0;
    b = a++;//先赋值, 再自增
    assert(a != b);//1 != 0

    //3. 比较运算符
    //==, !=, >, <, >=, <=, 少数情况下比较两个对象是否完全相同使用函数: identical()
    var xnull, ynull;
    assert(xnull == ynull);//true

    //4.Type test operators
    //as, is, is!
    //as: 类型转换(Typecast)
    //is: object 是否是某个类型
    //is!: object 是否不是某个类型
    final emp = Person();
    emp.firstName = 'Tom';
    if (emp is Person) {
      emp.firstName = 'Bob';
    }

    //5. 赋值运算符
    //=, ??= 
    var aInt = 1;
    var bInt;
    bInt ??= aInt;//判断 bInt 是否为空, 为空则赋值, 不为空保持原来的值

    //复合赋值运算符: =, -=, +=, /=, %=, ~/=, <<=, >>=, &=, ^=, |=
    var assValue = 2;
    assValue *= 3;// assValue = assVulue * 3
    assert(assValue == 6);

    //6. 逻辑运算符
    //&&, ||, !
    var colu = 2;
    var done = true;
    if (!done && (colu == 0 || colu == 3)) {
      //to do something....
    }

    //7.按位运算符, 偏移运算符
    //& 与, | 或, ^ 异或(相同为1不同为0), ~ 非, << 左偏移, >> 右偏移
    final value = 0x22;
    final bitmask = 0x0f;
    assert((value & bitmask) == 0x02); // 与
    assert((value & ~bitmask) == 0x20); // 与 非
    assert((value | bitmask) == 0x2f); // 或
    assert((value ^ bitmask) == 0x2d); // 异或
    assert((value << 4) == 0x220); // 左偏移
    assert((value >> 4) == 0x02); // 右偏移

    //8.条件运算符
    // isTrue ? expr1 : expr2
    // expr1 ?? expr2
    bool isPublic = true;
    var visibility = isPublic ? 'public' : 'private';
    String aStr = visibility ?? 'adf';
    
    //9.Cascade notation (..) 
    //级联符号
    /*
    querySelector('#confirm') // Get an object.
      ..text = 'Confirm' // Use its members.
      ..classes.add('important')
      ..onClick.listen((e) => window.alert('Confirmed!'));
    */
    //级联符号也可以嵌套使用
    /*
    final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
    .build();
    */

    //对于返回值是对象的函数使用时要注意, 不能对返回值为 void 的函数构造级联 cascade

    //十五. 控制流语句
    //if else
    //for 循环
    //while 和 do-while
    //break 和 continue
    //switch case
    //assert
    //try-catch 和 throw
    
    //Dart 中的闭包会捕捉变量
    var callbacks = [];
    for (var i = 0; i < 2; i++) {
      callbacks.add(() => print(i));
    }
    callbacks.forEach((c) => c());
    //输出: 0, 1

    //遍历对象可以使用, forEach() 函数

    //Iterable classes 比如 List 和 Set, 也支持 for-in 语句
    var collection = [1, 2, 3];
    for (var item in collection) {
      print(item);
    }

    //对于 list 和 set, 以下两种写法相同
    for (int i = 0; i < collection.length; i++) {
      if (collection[i] > 1) {
        print(collection[i]);
      }
    }

    collection
    .where((c) => c > 1)
    .forEach((c) => print(c));

    //Switch case
    //Switch case 和 Enum 配合使用, Dart 中 Switch 语句倾向用于 limited circumstances
    //比如 interpreters 或 scanners
    //非空 case 语句, 必须以 break(或 continue, throw, return)结尾

    var command = 'open';
    switch (command) {
      case 'closed':
        print('closed');
        return;
      case 'open':
        print('open');
        break;
      default:
        print('default');
    }

    // Dart 支持空 case 语句, 空 case 语句会 fall-through
    var serverError = '404';
    switch (serverError) {
      case '501':
      case '404':
        print('page lost');
        break;
      default:
        print('other errors');
    }

    //非空语句 fall-through, 使用 continue 语句和一个 label
    var plants = 'tree';
    switch (plants) {
    case 'flower':
      print('flower');
      continue flower;
    flower:
    case 'tree':
      print('tree');
      break;
    default:
      print('other plant');
    }
    //case 语句中可以有 local variables

    //Assert
    //assert 语句在条件不成立时, 中断代码执行
    //assert 只在 debug 模式下起作用
    //可以给 assert 添加一个 message
    var urlString = 'https://www.google.com';
    assert(urlString.startsWith('https'), 'url $urlString should start with "https".');

    //Exceptions
    //Dart 中 exception 必须被捕获处理, 不然 isolate 会终止
    //Dart 提供 Exception 和 Error 类型, 以及许多预定义子类, 也可以定义自己的 exception.
    //Dart 可以 throw 任何非空的对象, 不止是 Exception 和 Error, 但 Production-quality 代码
    //通常抛出 Error 和 Exception

    //Throw
    //抛出 Exception
    throw FormatException('Expected at least 1 section');
    //抛出任何非空对象
    throw 'out of llamas';

    //因为抛出异常是一条语句, 可以使用 =>
    void distanceTo(String other) => throw UnimplementedError();

    //Catch
    //捕获异常可以阻止异常 propagating, 除非你 rethrow 异常.
    // try {
    //   breedMoreLlamas();
    // } on OutOfLlamasException {
    //   buyMoreLlamas();
    // }

    //如果异常的类型不止一种, 可以写多个 catch 语句.第一个匹配抛出对象类型的 catch 处理异常.
    //如果 catch 语句没有指定类型, 那么可以匹配任何抛出类型
    // try {
    //   breedMoreLlamas();
    // } on OutOfLlamasException {//指定类型
    //   buyMoreLlamas();
    // } on Exception catch (e) {
    //   print('unknown exception: $e');
    // } catch (e) {//任何类型
    //   print('something really unknown: $e');
    // }

    //on 用来指定异常类型, catch 用来捕获异常对象
    //可以用 catch 捕获一个或两个参数, 第一个是抛出的异常, 第二个是 stack trace
    try {
      //...
    } on Exception catch (e) {
      print('exception details:\n $e');
    } catch (e, s) {
      print('exception details:\n $e');
      print('stack trace:\n $s');
    }

    //使用 rethrow 部分处理异常, 允许它 propagate
    void misbehave() {
      try {
        dynamic foo = true;
        print(foo++);
      } catch (e) {
        print('misbehave() partially handled ${e.runtimeType}.');
        rethrow;
      }
    }
    // misbehave 函数部分处理了异常

    void main() {
      try {
      misbehave();
    } catch (e) {
      print('main() finished handling ${e.runtimeType}.');
    }
    //main 函数完全处理了异常

    //Finally
    //为了确保代码不管是否有异常抛出都正常运行, 使用 finally 语句, 如果没有 catch 语句匹配
    //异常, 在 finally 中运行
    // try {
    //   breedMoreLlamas();
    // } finally {
    //   cleanLlamaStalls();
    // }

    // try {
    //   breedMoreLlamas();
    // } catch (e) {
    //   print('error: $e');
    // } finally {
    //   cleanLlamaStalls();
    // }

    //十六. Classes
    //Dart 是一门面向对象的语言, 有 classes 和 mixin-based 继承.每个对象都是一个类的实例
    //所有的类都 descend from Object. mixin-based 继承 意味着除了 Object, 所有的类都有一个父类
    //父类的 body 可以被重用

    //类成员
    //对象的成员有 function, method, instance variable. 使用点语法调用
    var p = Point(2, 2);
    assert(p.y == 2);
    var distance = p.distanceTo(Point(4, 4));

    //使用 ?. 避免左边为 null 时报错
    // p?.x = 4;

    //constructors(构造方法)
    //constructors 名可以是 ClassName 或者 ClassName.identifier.
    //下例中分别用 Point() 和 Point.fromJson() 创建一个了 Point 对象
    var p1 = Point(2, 2);
    var p2 = Point.fromJson({'x': 1, 'y': 2});

    //在 constructors 前可以加可选关键字 new, Dart2 之后 new 变为可选
    // var p1 = new Point(2, 2);
    // var p2 = new Point.fromJson({'x': 1, 'y': 2});

    //一些类使用 constant constructors, constructor 前加关键字 const 可以
    //创建一个编译时常量
    var p = const ImmutablePoint(2, 2);

    //创建两个相同的编译时常量
    var a = const ImmutablePoint(2, 2);
    var b = const ImmutablePoint(2, 2);
    assert(identical(a, b));//a 和 b 是相同的实例

    //在一个常量 context 中, 可以忽略 constructor 或 literal 前的 const 关键字(Dart 2)
    const pointAndLine = const {
      'point': const [const ImmutablePoint(0, 0)],
      'line': const [const ImmutalbePoint(1, 10), const ImmutablePoint(2, 11)],
    };

    //常量 context 中, 可以忽略所有 const 关键字, 除了第一个
    const pointAndLine = {
      'point': [ImmutablePoint(0, 0)],
      'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
    };

    //如果 constant constructor 不在常量 context 中, 并且被调用没有 const, 则创建
    //的是一个非常量的对象
    var a = const ImmutablePoint(1, 1); // Creates a constant
    var b = ImmutablePoint(1, 1); // Does NOT create a constant
    assert(!identical(a, b));  //不同的实例

    //获取对象的类型
    //runtime 时获取一个对象的类型使用 runtimeType 属性
    print('the type of a is ${a.runtimeType}');

    //以上是如何使用一个类, 接下来是如何实现一个类

    //Instance variables
    //声明实例变量
    class Point {
      var x;//声明实例变量 x, 初始化为 null
      var y;
      var z = 0;
    }
    //所有未初始化的实例变量的值为 null
    //所有实例变量都生成一个隐含的 getter 方法, Non-final 同样生成一个隐含的 getter 方法
    // class Point1 {
    //   var x;
    //   var y;
    // }

    // void main() {
    //   var point = Point();
    //   point.x = 4;
    //   assert(point.x == 4);
    //   assert(point.y == null);
    // }

    //声明时初始化而不是在 constructor 或 method 中, 则实例变量的值创建时间在
    //constructor 和 它的初始化列表执行之前

    //Constructor
    //声明一个 constructor 通过创建一个名字和类名相同的函数, 也可以加上一个 identifier
    class APoint {
      var x, y;
      APoint(String x, String y) {
        // There's a better way to do this, stay tuned
        this.x = x;
        this.y = y;
      }
    }
    //关键字 this 指向当前实例, Dart 中只有名字冲突的时候才用 this, 其它地方忽略
    //Dart 的语法糖可以使 constructor 更简单
    class BPoint {
      var x, y;
      BPoint(this.x, this.y);
    }

    //Default constructors
    //如果没有声明一个 constructor, 则会提供一个默认的 constructor, 默认 constructor
    //没有参数并且调用父类的无参数 constructor

    //Constructors aren’t inherited
    //子类不能继承父类的 constructor, 没有声明 constructor 的子类只有默认 constructor

    //Named constructors
    //使用 Named constructors 实现多个 constructor 或者提供额外的 说明
    class CPoint {
      var x, y;

      Point(this.x, this.y);

      Point.origin() {
        x = 0;
        y = 0;
      }
    }
    
    //Invoking a non-default superclass constructor
    //默认地,子类的 constructor 调用父类无名, 无参的 constructor
    //父类 constructor 在 constructor body 开始的时候调用
    //如果  initializer list 也被使用, 它汇总 superclass 被调用之前执行
    //执行顺序:
    //1. initializer list
    //2. superclass’s no-arg constructor
    //3. main class’s no-arg constructor

    //如果父类没有无名, 无参的 constructor, 则必须手动调用父类的一个 constructor, 
    //指定父类的 constructor 在 : 之后, constructor body 之前
    //下例中, 子类的 constructor 调用了父类的 named constructor
    class Person {
      String firstName;
      Person.fromJson(Map data) {
        print('in person');
      }
    }

    class Employee extends Person {
      Employee.fromJson(Map data) : super.fromJson(data) {
        print('in Employee');
      }
    }
    void main() {
      var emp = new Employee.fromJson({});
      if (emp is Person) {
        emp.firstName = 'bob';
      }
      (emp as Person).firstName = 'bob';
    }
    
    //由于父类 constructor 的 参数在调用之前被 evaluated, 参数可以是一个表达式
    //父类参数不能访问 this, 所有参数可以是 static 方法 不能是 instance 方法
    class Employee extends Person {
      Employee() : super.fromJson(getDefaultData());
      // ···
    }

    //Initializer list
    //在调用父类 constructor 之前, 可以初始化实例变量, 用冒号
    class PointDot {
      var x, y;
      PointDot.fromJson(Map<String, num> json)
        : x = json['x'], y = json['y'] : super.fromJson({}) {

        }
    }
    //initializer 右边不能访问 this

    //也可以在 initializer list 用 assert 验证输入
    class PointDotA {
      var x, y;
      PointDotA.withAssert(this.x, this.y) : assert(x >= 0){
        print('In Point.withAssert(): ($x, $y)');
      }
    }

    //Initializer lists 可以方便的创建 final fields
    //下例在 Initializer lists 中初始化了三个 final fields
    class PointDotB {
      final double x;
      final double y;
      final double distanceFromOrigin;
      
      PointDotB(x, y)
        : x = x, y = y, distanceFromOrigin = sqrt(x * x + y * y);
    }

    main() {
      var p = new Point(2, 3);
      print(p.distanceFromOrigin);
    }

    //Redirecting constructors
    //有时一个 constructor 的目的是 redirect 到同类中另一个 constructor, 
    //redirecting constructor 的 body 是空的, constructor 的调用跟在 : 之后
    class PointDotC {
      double x, y;
      PointDotC(this.x, this.y);
      PointDotC.alongXAxis(double x) : this(x, 0);
    }

    //Constant constructors
    //如果一个类产生的对象不会改变, 可以让该对象成为编译常量, 定义一个 const constructor
    //确保所有的实例变量都是 final
    class ImmutablePoint {
      static final ImmutablePoint origin = 
        const ImmutablePoint(0, 0);
      final double x, y;
      const ImmutablePoint(this.x, this.y);
    }
    //Constant constructors 创建的不总是常量

    //Factory constructors
    //使用关键字 factory, 当一个 constructor 不总是创建该类的新实例.例如, Factory constructors
    //可以从 cache 中返回一个实例, 或者返回子类的一个实例
    class Logger {
      final String name;
      bool mute = false;
      static final Map<String, Logger> _cache =
        <String, Logger>{};
      factory Logger(String name) {
        if (_cache.containsKey(name)) {
          return _cache[name];
        } else {
          final logger = Logger._internal(name);
          _cache[name] = logger;
          return logger;
        }
      }

      Logger._internal(this.name);
      void log(String msg) {
        if (!mute) {
          print(msg);
        }
      }
    }
    //Factory constructors 不能访问 this
    //Factory constructors 的调用和其它 constructor 一样
    var logger = Logger('ui');
    logger.log('button clicked');

    //十七. Method
    //method 为对象提供了行为
    
    //Instance method
    //Instance method 可以访问实例变量和 this
    class Pointt {
      double x, y;
      Pointt(this.x, this.y);
      
      double distanceTo(Pointt other) {
        var dx = x - other.x;
        var dy = y - other.y;
        return sqrt(dx * dx + dy * dy);
      }
    }

    //Getters and setters
    //getter 和 setter 提供了访问对象属性的权限, 可以通过实现 getter 和 setter 
    //方法创建 additional 属性, 关键字 get 和 set
    class Rectangle {
      num left, top, width, height;
      Rectangle(this.left, this.top, this.width, this.height);
      num get right => left + width;
      set right(num value) => left = value - width;
      num get bottom => top + height;
      set bottom(num value) => top = value - height;
    }
    void main() {
      var rect = Rectangle(3, 4, 20, 15);
      assert(rect.left == 3);
      rect.right = 12;
      assert(rect.left == -1);
    }
    //Note: Operators such as increment (++) work in the expected way, 
    //whether or not a getter is explicitly defined. To avoid any
    // unexpected side effects, the operator calls the getter exactly once,
    // saving its value in a temporary variable.

    //Abstract methods
    //Instance, getter 和 setter 方法可以抽象, 定义在一个接口中实现取决于其它类
    //抽象方法只存在于 abstract classes
    //定义一个抽象方法, 使用分号 ; 而不是 method body
    abstract class Doer {
      void doSomething();//定义抽象方法
    }

    class EffectiveDoer extends Doer {
      void doSomething() {
        //实现抽象方法
        //...
      }
    }

    //Abstract classes
    //使用 abstract 定义一个抽象类(不能实例化的类),  
    //Abstract classes are useful for defining interfaces, often with some implementation. 
    //If you want your abstract class to appear to be instantiable, define a factory constructor.
    //抽象类通常有抽象方法:
    //抽象类
    abstract class AbstractContainer {
      // Define constructors, fields, methods...

      void updateChildren(); // Abstract method.
    }

    //Implicit interfaces
    //每个类隐式定义了一个接口包含所有的实例成员以及任何它实现的接口, 如果想创建 class A 支持 class B 的 API, 
    //但却不继承 class B 的实现, class A 应该实现 B 的接口
    //一个类通过在 implement 中声明 interface, 然后提供 interface 所需要的 API 来实现一个或多个 interface
    class Student {
      final _name;
      Student(this.name);
      String greet(String who) => 'hello, $who, i am $_name';
    }

    class Imposter implements Student {
      get _name => '';
      String greet(String who) => 'hi $who, do you know who i am?';
    }

    String greetBob(Student stu) => stu.greet('bob');
    void main() {
      print(greetBob(Student('kathy')));
      print(greetBob(Impostor()));
    }

    //下例指定一个类实现多个 interface
    class Postion implements Comparable, Location {...}

    //Extending a class
    //使用 extends 创建子类, 用 super 指向父类
    class Television {
      void turnOn() {
        _illuminateDisplay();
        _activateIrSensor();
      }
      //...
    }

    class SmartTelevision extends Television {
      void turnOn() {
        super.turnOn();
        _bootNetworkInterface();
        _initializeMemory();
        _upgradeApps();
      }
      //...
    }

    //Overriding members
    //子类可以 override 父类的实例方法, getter, setter.使用 @override
    class SmartTelevision extends Television {
      @override
      void turnOn() {...}
      // ···
    }
    //To narrow the type of a method parameter or instance variable
    // in code that is type safe, you can use the covariant keyword.

    //Overridable operators
    //部分运算符可以 override, 详见表
    //下例 override 了 + , - 运算符
    class Vector {
      final int x, y;
      Vector(this.x, this.y);
      Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
      Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
    }
    void main() {
      final v = Vector(2, 3);
      final w = Vector(2, 2);

      assert(v + w == Vector(4, 5));
      assert(v - w == Vector(0, 1));
    }

    //noSuchMethod()
    //当试图使用一个不存在的方法或实例变量, 为了 detect 或 react, 可以 override noSuchMethod()
    class A {
      // Unless you override noSuchMethod, using a
      // non-existent member results in a NoSuchMethodError.
      @override
      void noSuchMethod(Invocation invocation) {
        print('you are trying to use a non-existent member:' + ${invocation.memberName});
      }
    }

    //不能调用一个没有实现的方法, 除非以下一条为 true:
    //1. receiver 为 static 类型 dynamic
    //2. receiver 有一个 static 类型定义了未实现的方法(abstract 方法也可以), receiver dynamic 类型
    //对 noSuchMethod() 方法的实现和 Object 不同

    //十八. Enumerated types
    //枚举声明使用 enum
    enum Color {red, green, blue}

    //每个枚举值都有一个 index, 从 0 开始
    assert(Color.red.index == 0);
    assert(Color.green.index == 1);
    assert(Color.blue.index == 2);

    //获取所有枚举值, 获取枚举值的 List, 使用 values 常量
    List<Color> colors = Color.values;
    assert(colors[2] == Color.blue);

    //枚举和 switch 语句配合使用
    var aColor = Color.blue;
    switch (aColor) {
      case Color.red:
        print('Red as roses!');
        break;
      case Color.green:
        print('Green as grass!');
        break;
      default: // Without this, you see a WARNING.
        print(aColor); // 'Color.blue'
    }

    //枚举类型的限制:
    //1.不能子类化, mix in, 或者 implement
    //2.不能实例化

    //十九. Adding features to a class: mixins
    //Minxins 是在 multiple class hierarchies 中复用一个类的代码的方法
    //使用关键字 with 后跟一个或多个要 mixin 的名字:
    class Musician extends Performer with Musical {
      // ···
    }

    class Maestro extends Person
        with Musical, Aggressive, Demented {
      Maestro(String maestroName) {
        name = maestroName;
        canConduct = true;
      }
    }

    //implement mixin, 创建一个类继承自 Object, 不声明 constructor, 不调用 super
    abstract class Musical {
      bool canPlayPiano = false;
      bool canCompose = false;
      bool canConduct = false;

      void entertainMe() {
        if (canPlayPiano) {
          print('Playing piano');
        } else if (canConduct) {
          print('Waving hands');
        } else {
          print('Humming to self');
        }
      }
    }

    //二十. Class variables and methods
    //使用 static 关键字 implement 类型变量和方法

    //Static variable
    //static 变量在使用时才初始化
    class Queue {
      static const initialCapacity = 16;
      //...
    }
    
    void main() {
      assert(Queue.initialCapacity == 16);
    }

    //Static methods
    //static 方法不能访问 this
    class Point {
      num x, y;
      Point(this.x, this.y);

      static num distanceBetween(Point a, Point b) {
        var dx = a.x - b.x;
        var dy = a.y - b.y;
        return sqrt(dx * dx + dy * dy);
      }
    }

    void main() {
      var a = Point(2, 2);
      var b = Point(4, 4);
      var distance = Point.distanceBetween(a, b);
      assert(2.8 < distance && distance < 2.9);
      print(distance);
    }

    //对于常用的功能方法, 使用 top-level functions 而不是 static method
    //可以将 static 方法作为 compile-time 常量, 比如作为参数传给 constant constructor

    //二十一. Generics
    //泛型如 List<E>, E 代表参数类型
    //泛型对于类型安全是必要的, 泛型还有其它好处: 
    //1. 正确的指定类型可以产生更好 generated 的代码
    //2. 减少代码重复

    //二十二. Using collection literals
    //List 和 map literal 可以参数化(parameterized), 
    var names = <String>['Seth', 'Kathy', 'Lars'];
    var pages = <String, String>{
      'index.html': 'Homepage',
      'robots.txt': 'Hints for web robots',
      'humans.txt': 'We are people, not machines'
    };

    //Using parameterized types with constructors
    //使用 constructor 时, 限定一个或多个类型, 把类型放在 <> 中, 跟在 class name 后
    var names = List<String>();
    names.addAll(['Seth', 'Kathy', 'Lars']);
    var nameSet = Set<String>.from(names);
    var views = Map<int, View>();

    //Generic collections and the types they contain
    //Dart 泛型类型是具体化的, 意味着在 runtime 时他们就携带了他们的类型信息
    var names = List<String>();
    names.addAll(['Seth', 'Kathy', 'Lars']);
    print(names is List<String>); // true

    //Restricting the parameterized type
    //实现泛型时, 如果想限制参数类型, 可以使用 extends
    class Foo<T extends SomeBaseClass> {
      String toString() => 'instance of "Foo<$T>"';
    }
    class Extender extends SomeBaseClass {...}
    //可以用 SomeBaseClass 或者它的子类作为参数
    var someBaseClassFoo = Foo<SomeBaseClass>();
    var extenderFoo = Foo<Extender>();
    
    //也可以不限定
    var foo = Foo();
    print(foo);

    //Using generic methods
    //最初, Dart 泛型只适应于 class, 最新的语法 generic methods, 允许方法和函数使用类型参数
    T first<T>(List<T> ts) {
      T tmp = ts[0];
      return tmp;
    }
    //上例 first<T>的泛型参数, 允许以下几个地方使用类型参数 T
    //1. 函数的返回值
    //2. 参数类型
    //3. 本地变量类型

    //二十三. Libraries and visibility
    //import 和 library 指令可以帮助你创建模块化, 可复用的代码库. Libraries 不仅提供了 API,
    //也是一个 privacy 单元, 以下划线开头的 identifier 只在 library 中可见.
    //每个 Dart APP 都是一个 library, 即使没有使用 library 指令
    //library 可以用 package 分发

    //Using libraries
    // import 唯一要求的参数是 a URI specifying the library.对于内置 library, URI 有
    //特殊的 dart: scheme. 对于其它 library, 可以使用文件系统路径或者 package: scheme
    //package: scheme 指定了 package manager 如 pub tool 提供的 library

    import 'package:test/test.dart';
    //URI 代表 uniform resource identifier, URL(uniform resource locators)是 URI 的常见形式

    //Specifying a library prefix
    //如果导入的两个 library 有冲突的 identifier, 可以为其中一个或两个 library 指定 prefix
    //例如, 如果 library1 和 library2 都有一个 Element 类:
    import 'package:lib1/lib1.dart';
    import 'package:lib2/lib2.dart' as lib2;

    // Uses Element from lib1.
    Element element1 = Element();

    // Uses Element from lib2.
    lib2.Element element2 = lib2.Element();

    //Importing only part of a library
    //如果只使用 library 的一部分, 可以选择性的导入 library
    // 只导入 foo
    import 'package:lib1/lib1.dart' show foo;

    // 导入 lib2 除了 foo的剩余部分.
    import 'package:lib2/lib2.dart' hide foo;

    //Lazily loading a library
    //应用在需要的时候加载, 以下是几个可能使用懒加载的场景:
    //1. 减少 APP 的启动时间
    //2. To perform A/B testing—trying out alternative implementations of an algorithm
    //3. 加载极少使用的功能, 如选择弹框和对话框

    //懒加载一个 library, 必须在导入时使用 deferred as
    import 'package:greetings/hello.dart' deferred as hello; 

    //需要使用 library, 调用 loadLibrary()
    Future greet() async {
      await hello.loadLibrary();
      hello.printGreeting();
    }
    //await 暂停代码执行直到 library 加载完毕
    //可以对一个 library 多次调用 loadLibrary(), 这个library 只会加载一次
    //使用延迟加载的注意事项:
    //1. 延迟加载 library 的常量在 importing file 中不是常量.这是常量在 library 加载前不存在
    //2. importing file 中不能使用延迟加载 library 中的类型. Instead, consider moving 
    //interface types to a library imported by both the deferred library and the importing file
    //3. Dart 隐式的在你用 deferred as namespace 定义的 namespace 中插入 loadLibrary()
    //loadLibrary() 返回 Future

    //Implementing libraries
    //详见 Create Library Packages , 怎么实现一个 library package

    //二十三. Asynchrony support
    //Dart library 中有很多函数返回  Future 或 Stream 对象, 这些函数时异步的, 它们在创建一个耗时的操作(比如 I/O)
    //之后马上返回, 不会等待执行完成
    //关键字 async 和 await 支持异步编程

    //Handling Futures
    //当你需要一个已经完成的 Future 的结果, 可以有两种选择:
    //1. 使用 async 和 await
    //2. 使用 Future API

    //使用 async 和 await 的代码时异步代码, 但是看起来像同步代码
    await lookUpVersion();
    //使用 await, 代码必须在 async 函数中:
    Future checkVersion() async {
      var version = await lookUpVersion();
      //...
    }
    //使用 try, catch, finally 处理使用 await 代码中的 error 和 cleanup
    try {
      version = await lookUpVersion();
    } catch (e) {

    }

    //在 async 函数中可以多次使用 await
    var entrypoint = await findEntrypoint();
    var exitCode = await runExecutable(entrypoint, args);
    await flushThenExit(exitCode);
    //在 await 表达式中, 表达式的值通常是 Future, 如果不是这个值自动 wrapped in a Future
    //Future 代表一个返回值或错误

    //使用 await 时, 如果有一个 compile-time 错误, 要确保 await 在一个 async 函数中
    // Future main() async {
    //   checkVersion();
    //   print('In main: version is ${await lookUpVersion()});
    // }

    //Declaring async functions
    //函数体以 async 开头的是 async 函数
    //给函数添加 async 关键字, 则函数返回一个 Future 值
    //例如, 以下函数返回值为 String, 变为 async 函数后, 返回值变为 Future<String>
    String lookUpVersion() => '1.0.0';
    Future<String> lookUpVersion() async => '1.0.0';

    //如果函数不需要返回值, 返回一个 Future<void>

    //Handling Streams
    //要从 Stream 得到值, 有两种选择:
    //1. 用 async 和 asynchronous 来 loop(await for)
    //2. 使用 Stream API
    
    //注意在使用 await for 之前, 确保它可以使代码更清晰, 并且你确实想要等待所有 stream 的结果
    //例如, 对 UI 时间监听时不能使用 await for, 因为 UI framework 发送无限的 streams of events

    //asynchronous for loop 的形式:
    await for (varOrType identifier in expression) {
      // Executes each time the stream emits a value.
    }
    //表达式的值必须是 Stream 类型, 执行顺序如下:
    //1. 等待 stream emit 一个值
    //2. Execute the body of the for loop, with the variable set to that emitted value.
    //3. 重复 1 和 2 

    //停止监听 stream, 可以用 break 或者 return 语句
    //实现一个 asynchronous for loop时, 如果有 compile-time error, 确保 await for 在 async function 中
    Future main() async {
      // ...
      await for (var request in requestServer) {
        handleRequest(request);
      }
      // ...
    }

    //二十四. Generators
    //当需要 lazily 产生一个 values 的序列, 可以用 generator 函数. Dart 内置对两种 generator 函数的支持:
    //1. Synchronous generator: Returns an Iterable object.
    //2. Asynchronous generator: Returns a Stream object.

    //实现 synchronous generator 函数, 将函数体标记为 sync*, 并且用 yield 语句传递值
    Iterable<int> naturalsTo(int n) sync* {
      int k = 0;
      while (k < n) yield k++;
    }

    //实现 asynchronous generator 函数, 将函数体标记为 async*, 并且用 yield 语句传递值
    Stream<int> asynchronousNaturalsTo(int n) async* {
      int k = 0;
      while (k < n) yield k++;
    }

    //如果 generator 是递归的, 可以用 yield* 提高性能
    Iterable<int> naturalsDownFrom(int n) sync* {
      if (n > 0) {
        yield n;
        yield* naturalsDownFrom(n - 1);
      }
    }

    //二十五. Callable classes
    //为了让你的 Dart class 可以像函数一样调用, implement the call() 方法
    //下例中, WannabeFunction 类定义了一个 call() 函数
    class WannabeFunction {
      call(String a, String b, String c) => '$a $b $c!';
    }

    main() {
      var wf = new WannabeFunction();
      var out = wf("Hi","there,","gang");
      print('$out');
    }

    //Isolates
    //大多数电脑, 甚至手机平台都有多核 CPU, 为了充分利用这些 CPU, 通常使用共享内存的线程并发执行,
    //然而, 共享状态的并发是一个错误的倾向, 可能导致代码变得复杂

    //Dart 中, 所有代码运行在 isolate 中, 而不是 thread. 每个 isolate 有自己的内存堆(heap)
    //确保每个 isolate 的状态都不能被其它 isolate 获取

    //Typedefs
    //Dart 中, 函数也是对象.typedef 给函数类型起了一个名字
    class SortedCollection {
      Function compare;

      SortedCollection(int f(Object a, Object b)) {
        compare = f;
      }
    }

    // Initial, broken implementation.
    int sort(Object a, Object b) => 0;

    void main() {
      SortedCollection coll = SortedCollection(sort);

      // All we know is that compare is a function,
      // but what type of function?
      assert(coll.compare is Function);
    }
    //当吧 f 赋值给 compare 时类型信息丢失了, f 是 (Object, Object) → int 类型, 然而 compare 是
    //Function 类型.如果我们改变代码使用明显的 name 并且保留类型信息, 那么开发者和 tools 都可以使用这些信息
    typedef Compare = int Function(Object a, Object b);

    class SortedCollection {
      Compare compare;

      SortedCollection(this.compare);
    }

    // Initial, broken implementation.
    int sort(Object a, Object b) => 0;

    void main() {
      SortedCollection coll = SortedCollection(sort);
      assert(coll.compare is Function);
      assert(coll.compare is Compare);
    }
    //因为 typedef 只是简单的 aliases, 它们提供了检查函数类型的方法
    typedef Compare<T> = int Function(T a, T b);
    int sort(int a, int b) => a - b;

    void main() {
      assert(sort is Compare<int>); // True!
    }
     
    //Metadata
    //Metadata 可以给代码提供额外的信息, metadata 以 @ 开头, 跟着一个 
    //compile-time constant, 或一个 constant constructor
    //Dart 中有两个可用的 annotation, @deprecated 和 @override
    class Television {
      /// _Deprecated: Use [turnOn] instead._
      @deprecated
      void activate() {
        turnOn();
      }

      /// Turns the TV's power on.
      void turnOn() {...}
    }
    //也可以自定义 metadata annotation, 下例定义了一个 @todo annotation:
    library todo;

    class Todo {
      final String who;
      final String what;

      const Todo(this.who, this.what);
    }
    //使用自定义 metadata annotation
    import 'todo.dart';

    @Todo('seth', 'make this do something')
    void doSomething() {
      print('do something');
    }
    //metadata 可以出现在 library, class, typedef, type parameter, 
    //constructor, factory, function, field, parameter, variable declaration
    // and before an import or export directive 之前
    //可以用 reflection 在运行时获取 metadata 

    //Comments(注释)
    //Single-line comments: //
    //Multi-line comments: /* ... */
    //Documentation comments: /// 或 /**
    //documentation comments 中, Dart 编译器忽略了所有文本, 除了 [] 中的


    /// A domesticated South American camelid (Lama glama).
    ///
    /// Andean cultures have used llamas as meat and pack
    /// animals since pre-Hispanic times.
    class Llama {
      String name;

      /// Feeds your llama [Food].
      ///
      /// The typical llama eats one bale of hay per week.
      void feed(Food food) {
        // ...
      }

      /// Exercises your llama with an [activity] for
      /// [timeLimit] minutes.
      void exercise(Activity activity, int timeLimit) {
        // ...
      }
    }

}



void foo1() {} //top-level function
class A {
  static void bar() {} //static 方法
  void baz() {} //实例方法
}

class Person {
  String firstName;
}