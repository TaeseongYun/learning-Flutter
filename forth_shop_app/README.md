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