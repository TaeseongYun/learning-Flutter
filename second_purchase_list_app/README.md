# What's diff between EdgeInsets.all() and EdgeInsets.symmetric

- 개인적인 생각이지만 .all()은 매개변수 하나를 가지고 left right top bottom 다 동일한 margin을 주는것이고 symmetric은 horizontal 과 vertical을 각각 나눠서 줄 수 있다.

# CrossAxis and MainAxis

- MainAxis과 CrossAxis는 각각 Row 나 Column에서 사용 되는데 의미하는 바는 MainAxis는 진행방향 기준이고 CrossAixs는 다른 남은 방향을 말하는것이다. 둘 다 어느 위치에 둘것인가 style 정하는 클래스

# ListView(children: []) vs ListView.builder()

- 두개의 차이점은 ListView.builder()가 조금 더 lazy 하고 무한대로 생성 될 수 있다.
따라서, 리스트 수가 6개 미만일때는 전자, 6개 이상으로 많다 할 때에는 후자를 사용한다.

## ETC.
- 생성자 만들때에는 제일 처음 매개변수로 _(underLine; private) 가 못온다는 사실을 알게 되었다.
- onPressed:() => test() 의 정확한 사용 이유는 해당 함수에서 arguments 를 전달 즉 파라미터를 전달 해주기 위해서 사용하는 것(개인적인 생각)