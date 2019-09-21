# What's diff between EdgeInsets.all() and EdgeInsets.symmetric

- 개인적인 생각이지만 .all()은 매개변수 하나를 가지고 left right top bottom 다 동일한 margin을 주는것이고 symmetric은 horizontal 과 vertical을 각각 나눠서 줄 수 있다.

# CrossAxis and MainAxis

- MainAxis과 CrossAxis는 각각 Row 나 Column에서 사용 되는데 의미하는 바는 MainAxis는 진행방향 기준이고 CrossAixs는 다른 남은 방향을 말하는것이다. 둘 다 어느 위치에 둘것인가 style 정하는 클래스

# ListView(children: []) vs ListView.builder()

- 두개의 차이점은 ListView.builder()가 조금 더 lazy 하고 무한대로 생성 될 수 있다.
따라서, 리스트 수가 6개 미만일때는 전자, 6개 이상으로 많다 할 때에는 후자를 사용한다.

## ETC.
- 생성자 만들때에는 제일 처음 매개변수로 _(underLine; private) 가 못온다는 사실을 알게 되었다.

- 1- onPressed:() => test() , 2 - onPressed:() {//다른 행동 가능// test() //다른 행동 가능//}, 3 -onPressed: test,
-> 1번과 2번의 차이 Dart 언어에서 => 는 표현식 일때만 사용가능 즉, onPressed함수가 실행될 때 변수가 필요하면 2번을 사용 아니면 1번을 사용한다.(함수에 매개변수가 들어가는 경우)
3번은 함수에 매개변수가 없을 때 주로 사용하는 방식.

- BottomSheet왁 같이 화면이 Stack 처럼 겹겹이 쌓이는 View는 MediaQuery로 화면 크기를 가져와야한다. 미디어 쿼리는 MaterialApp클래스가 초기화 되는 시점에 생성되는데 처음엔 StatefulWidget 하나의 클래스로만 runApp을 하여서 MaterialApp클래스가 끝까지 초기화가 되지 않아 MediaQuery 에러가 계속 나는 것이었다.
  후에 보니 StatelessWidget 으로 MaterialApp클래스를 초기화 완료 하니 에러가 사라짐
  => MyRootPage()이름은 가지고 StatelessWidget을 상속받는 클래스를 runApp에 넣어 주었음.

# StatefulWidget 안의 widget Property
- StatefulWidget 클래스를 생성하게 되면 총 2개의 클래스가 생성된다.
  하나는 StatefulWidget을 상속받는 클래스 다른 하나는 State<T> 를 상속받는 클래스가 생성되게 되는데 주로 이용되는건 StatefulWidget클래스 그러기때문에 생성자도 StatefulWidget을 상속받는 클래스에서 만들게 된다. 하지만 기술적으로 보면 어느 한 클래스에서 생성한 함수는 다른 클래스에서 객체를 만들지 않고선 사용할 수 없다. Flutter 에서는 고맙게도 이를 widget property가 대신하여 접근이 가능하게 만들어 준다.

## ThemeData.light().texttheme.copyWith()??
  - copyWith메소드를 사용하게 되면 해당 메소드 안에서 사용한 property를 merge하게 된다.

전체를 merge하고싶으면 merge()메소드를 사용하면된다.

## then() Function??
- 미국 인턴때 여러번 사용한 Typescript내에서는 Promise형 Dart안에서는 `Future`형 함수 실행 형태는 어떤 행동이 이루어졌을 시 함수를 취한다 라는 뜻 then함수는 파라매터로 Function을 받는다.

## Cupertino Widget , FractionallySizedBox
- iOS 위젯 Optional하게 사용 가능 하다 , FractionallySizedBox는 사용 가능 한 총 공간이 있지만 일부로 자식의 크기를 조절하는 클래스

## GestureDetector

- iOS 에는 IconButton이 따로 없기 때문에 GestureDetector로 감지 해야 한다.
- `Platform`클래스 사용하여 Android와 iOS를 구분한다.
- LayoutBuilder context와 constraint을 사용하여 넓이를 제한을 주는 것이다.(수정하면서 공부 할 것)

## Stateless  vs  Stateful lifecycle 차이점

- Stateless는 Constructor 호출 후 바로 build 생성
- Stateful은 Constructor 호출 후  initState() -> build() -> (사용자가 입력에 따라) setState() -> didUpdateWidget() -> 다시 build() 호출

## key 란 무엇인가?
[Youtube 바로가기](youtube.com/watch?v=kn0EOS-ZiIc)