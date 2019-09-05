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
- 이 키워드는 함수에서 매개변수를 함수를 사용하거나 포인터를 사용했을 시 이용하는 키워드이다. Kotlin개발 했던 나에겐 이것이 Function 키워드 라고 생각하면 쉬울 것이다.

  ```Kotlin
  fun add(addFunc: (a: Int, b: Int) -> Int): Int {
      return addFunc(10, 20)
  }

      val result = add{ x , y -> x + y }
      print("${result}")
    ```


  