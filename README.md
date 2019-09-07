# StatelessWidget vs StatefulWidget

## - StatelessWidget
- 처음 로드 될 때 딱 한번 그려지는 위젯
- StatefulWidget과는 다르게 `변경이 불가능함`.
- But, 해당 클래스가 쓸모 없다는것은 아니다. 변하지 않는 위젯을 화면에 그릴 때 비용이 적게들어 StatefulWidget 보다 유용하게 사용 가능


## - StatefulWidget

- 수동으로 리로드 시킬 필요가 없음.
- `setState` 함수가 불려지면 다시 그려지기 때문. 따라서 UI를 변경 시키려면 `setState`함수를 호출 해야함.
- Stateful 클래스를 생성 할 시 `createState` 함수를 오버라이드 함.
- 그러므로 `StatefulWidget`은 총 2개의 클래스가 필요함 (`StatefulWidget`을 extend하는 클래스, `State<Generic>`을 extend 하는 클래스)


# Custom Parameter
- 생성사를 만들시 () 안에 {}를 넣어준다면 optional 하게 만들어 줄 수 있다.
- 단 `객체를 생성할 시 어떤 생성자 매개변수에 넣을 것인지 명시 해줘야 한다`.
  
  EX) 
  
  ```Dart
  Question(
      firstText: _anyStringText
  )
  ```
- Dart 언어 에서는 private, protected, internal같은 접근 제한자가 없다, `_(underLine)`를 사용한 변수나 함수는 `private`가 된다.

# Function Keyword
- 이 키워드는 함수에서 매개변수를 함수를 사용하거나 포인터를 사용했을 시 이용하는 키워드이다. Kotlin개발 했던 나에겐 이것(고차함수)이 Function 키워드 라고 생각하면 쉬울 것이다.

  ```Kotlin

  -Dart Function keyword is similar
   kotlin 고차함수

   Kotlin 고차함수

    fun add( value1: Int, value2: Int, 
        addFunc: (a: Int, b: Int) -> Int): Int 
        {
            return addFunc(value1, value2)
        }

    val result = add(10, 20) { x , y -> x + y }


    print("${result}")

    결과값 -> 30
    ```

- Dart에서는 Maps을 간단하게 { key, value } 로도 표현 할 수 있다.
  ``` Dart
  - Dart

  val temp = [
      {'One': 1},
      {'Two': 2}
    ]

  key 값 'One' 넣으면 1 나옴
  ```

  ``` Kotlin
  - Kotlin

  val map = HashMap<String, Int>()

  map["One"] = 1

  println("${map["One"]}")
  결과값 -> 1
  ```

# What is the spread operator??

- Dart 언어에서는 스프레드 연산자(...) NULL을 허용한 스프레드 (...?)를 이용하여 여러요소를 간결하게 컬렉션에 삽입 가능하다.

- 또한 Dart 2.3에서는 컬렉션 if 컬렉션 for 가 등장하여 컬렉션 내부에서도 for, if 사용 가능하다

EX)
```Dart
var world = [
    'USA',
    'England',
    'Russia',
    if(asianCity) 'Korea'
]
print('${world}')

(if가 만족했다고 가정) 실행결과 -> ['USA', 'England', 'Russia', 'Korea']

var listOfInts = [1, 2, 3];
var listOfString = [
    '#0',
    for(var item in listOfInts) '#$item'
]
print('${listOfString}')
실행결과 -> ['#0', '#1', '#2', '#3']
```

- Dart 언어에서도 Java와 마찬가지로 3항 연산자가 존재

EX)
```Dart
_questionsText(; private와 같은 접근제한자가 없어 underline이 접근제한자로 대체) < = question.length ? Text('It is  true') : Text('It is false')
```

# How to do I make splitting widget?
- Scaffold의 내부 파라미터 body에서 코드 작성 시 많은 위젯들을 추가하면 가독성이 매우 떨어진다 예시로는 다음과 같다.

```Dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('It`s my first app'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questionText: questions[_questionIndex]['questionTexts'],
                  ),
                  ...(questions[_questionIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(
                        sendedHandler: answerQuestions, answerText: answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!!'),
              ),
      ),
    );
  }
  ```

  해당 코드를 customizing 하기전 위젯 클래스를 만들어 준다.
  
  EX)
```Dart
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestions;
  final int questionIndex;

  Quiz(
      {@required this.answerQuestions,
      @required this.questions,
      @required this.questionIndex}
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questionText: questions[questionIndex]['questionTexts'],
        ),
        ...(questions[questionIndex]['answer'] as List<String>).map((answer) {
          return Answer(sendedHandler: answerQuestions, answerText: answer);
        }).toList()
      ],
    );
  }
}
```

그후 Scaffold의 body parameter에 사용!
```Dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('It`s my first app'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestions: answerQuestions,
                questions: questions,
                questionIndex: _questionIndex,
              )
            : Center(
                child: Text('You did it!!'),
              ),
      ),
    );
  }
```