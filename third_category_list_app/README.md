# SliverGridDelegateWithMaxCrossAxisExtent
- 이 클래스는 GridView에 사용 되는 델리게이트 중 하나이다.
  주로 사용하는 프로퍼티는 총 4개로 `childAspectRatio`, `crossAxisSpacing`, `mainAxisSpacing`, `maxCrossAxisExtent` 가 있는데 첫 번째 것은  타일의 세로 비율, 두번째는 가로 방향으로 간격의 크기, 세 번째는 세로방향으로 간격의 크기, 마지막은 타일의 가로 크기 이다.

## Router
- 네비게이터를 사용하여 푸시를 해줄 때 라우터로 url을 사용하여 편리하게 사용 하는데 그럴 때엔 클래스를 하나 새로 두고 각 url 마다 case 를 두어 다르게 지정 그 후 새롭게 만든 클래스에 확장함수 형식으로 만들어둔다 `router.dart`를 보면 자세하게 나와있다.