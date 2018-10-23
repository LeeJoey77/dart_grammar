import 'package:flutter/material.dart';

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
    var message = StringBuffer('Dart is fun');
    for (var i = 0; i < 5; i++) {
      message.write('!');
    }
    print(message);


}

void foo1() {} //top-level function
class A {
  static void bar() {} //static 方法
  void baz() {} //实例方法
}

class Person {
  String firstName;
}