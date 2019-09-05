# StatelessWidget vs StatefulWidget

## - StatelessWidget
- 처음 로드 될 때 딱 한번 그려지는 위젯
- StatefulWidget과는 다르게 변경이 불가능함.
- But, 해당 클래스가 쓸모 없다는것은 아니다. 변하지 않는 위젯을 화면에 그릴 때 비용이 적게들어 StatefulWidget 보다 유용하게 사용 가능


## - StatefulWidget

- 수동으로 리로드 시킬 필요가 없음.
- setState 함수가 불려지면 다시 그려지기 때문.
- Stateful 클래스를 생성 할 시 createState 함수를 오버라이드 함.


# Custom Parameter
- 생성사를 만들시 () 안에 {}를 넣어준다면 optional 하게 만들어 줄 수 있다.