# Provider
- flutter 에는 state관리에 아주 유용한 Provider 패턴이 존재한다. 이를 사용하기 위해서는 의존성에 provider를 추가 시켜야 하고 여러군데에서 사용 하기위해선 가장 상단에 있는 즉 위젯 트리 제일 상단쪽에 있는 곳에다가 `ChangeNotifierProvider()`로 감싸준다.

## Provider.of`<T>`(context) vs Consumer`<T>`
- 프로바이더는 UI 상태를 관찰하다가 listener에 의해 UI가 변경되거나 `notifyListeners()` 가 호출되면 전체를 다시 리빌드 하는대신 Consumer는 감싸고 있는 위젯만 변경이 된다.
  
- Comsumer builder의 매개변수 중 child 매개변수가 있는데 감싼 위젯 중 변하는것을 원치는 위젯만 child 쪽으로 빼준다. (예시 Icon류)

## update 와 putIfAbsent
- 둘 다 Map 의 함수인데 (key, V value)가 매개변수이다. 따라서 Map 의 매개변수가 _item이고 _item.keys 부르게 되면 update 와 putIfAbsent를 사용 할 때 넣어줬던 key 값이 호출된다. update는 해당 되는 key 값에 정보를 변경 putIfAbsent은 정보가 있으면 넣지않고 없으면 정보를 넣는 함수이다.

## notifyListener() vs listener
- notifyListener는 UI가 변경 된게 있고 UI를 갱신하고 싶을 때 호출 하는 함수, listener는 위젯을 변경 어떤 이벤트가 왔을때 위젯을 변경하고 싶을 때 사용 하는 Provider.of(context) of의 프로퍼티 false로 주는 경우는 데이터를 딱 한번만 받고 싶을 때 설정

## TextField안의 focus
- build 함수 안에서 FocusNode 변수 만들어주고 2개의 텍스트 필드가 있을시 첫 텍스트 필드의 제출 버튼을 눌렀을 때 다음 텍스트 필드고 넘어가게 하려면 FocusScope.of(context) 가 필요하다
-  ex)
  ``` Dart
  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter correct Email';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocus),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter correct Password';
                      }
                      return null;
                    },
                    focusNode: _passwordFocus,
                  ),
   ```

- ex)
  ``` Dart
  void build(BuildContext context) {
      return Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_focusNode),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '가격',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _focusNode,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '설명',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _focusNode,
              ),
            ],
      )
  }
## GlobalKey
- 한 위젯에서 다른 위젯에 정보를 보내주거나 위젯의 상태를 유지해야 할때 사용하는 키.

## Future?
- Dart언어에서 Future는 다른언어(JS)의 Promise와 비슷하다 즉 비동기 처리를 하기 위한 클래스이다.
예를들어 처음엔 상자가 닫혀있는 상태로 전송 그 후 다른 코드들이 쭉 먼저 실행되고 그 후 Future로 전송 된 코드가 완료가 되면 다른 코드들이 실행 된 후 Future가 호출된다.
그리고 다른 한가지 예는 http 로  이미지 다운로드를 요청 하고 거기서 Future Object 를 던져준다 다른 코드를 쭉 실행하고 Future 오브젝트가 끝났다고 신호가오면 error를 보내서 처리한다.

3가지 상태  1. 완료되지않은 Future object  2. 완료 된 두가지 상태(error, data)

## 언제 async, await를 사용해?
- Future object를 받았는데 따로 두고 다른 작업 요청이 들어왔을때  그 작업보다 Future object 작업을 먼저 끝내놓고 다른 작업을 실행하고 싶다 할때에 async, await 사용 즉 async, await 를 사용 하여 Future object 작업을 처리를 하고 다른 작업을 하겠다.
  함수에 async를 붙히면 그 함수는 자동적으로 Future를 리턴하게 된다. await이 붙혀진게 종료 될때까지 기다렸다가 값 출력하고 그 다음 문장 실행 한다.


## TextFormField
- 만약 TextFormField에 패스워드를 사용하고 싶으면 TextFormField 속성 중 obscureText: true, 값을 추가 해 준다.

## Custome Painter??

- 원래 보통 동그라미나 네모가 아닌 특이한 모양을 context위에 그려주는 경우에 Custom Painter를 사용한다.

- function shouldRepaint  ?  =>  커스텀 페인터를 다시 그리냐 마냐를 설정하는 function 즉 새롬게 그려야할게 있으면 return 을 특정값으로 그게 아니라면 false

- function paint? =>  여기서 커스텀페인트에 띄울 그림을 그려주는것이다.

## Dart에서 사용되는 ".."

- 다른 언어를 접한 나에겐 조금 생소한 표현이 하나 있었다.
  
  ex)
   ```Dart
  final paint = Paint()..color = Colors.blue;
  ```
  어떻게 저렇게 되는건가 싶어서 유튜브를 참고해보니 Paint()..color = Colors.blue;를 한 구문이라고 보면 된다고 하였다.

  그나마 익숙한 Kotlin 언어에서 비슷한 예를 들자면 이것과 비슷한거다.
  
  ex)
  ``` Kotlin
  val paint = Paint().apply {
    color = Colors.blue;
  } 
  ```