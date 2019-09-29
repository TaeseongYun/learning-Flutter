# Provider
- flutter 에는 state관리에 아주 유용한 Provider 패턴이 존재한다. 이를 사용하기 위해서는 의존성에 provider를 추가 시켜야 하고 여러군데에서 사용 하기위해선 가장 상단에 있는 즉 위젯 트리 제일 상단쪽에 있는 곳에다가 `ChangeNotifierProvider()`로 감싸준다.

## Provider.of`<T>`(context) vs Consumer`<T>`
- 프로바이더는 UI 상태를 관찰하다가 listener에 의해 UI가 변경되거나 `notifyListeners()` 가 호출되면 전체를 다시 리빌드 하는대신 Consumer는 감싸고 있는 위젯만 변경이 된다.
  
- Comsumer builder의 매개변수 중 child 매개변수가 있는데 감싼 위젯 중 변하는것을 원치는 위젯만 child 쪽으로 빼준다. (예시 Icon류)