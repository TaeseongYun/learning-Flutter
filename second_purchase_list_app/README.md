# What's diff between EdgeInsets.all() and EdgeInsets.symmetric

- 개인적인 생각이지만 .all()은 매개변수 하나를 가지고 left right top bottom 다 동일한 margin을 주는것이고 symmetric은 horizontal 과 vertical을 각각 나눠서 줄 수 있다.

# CrossAxis and MainAxis

- MainAxis과 CrossAxis는 각각 Row 나 Column에서 사용 되는데 의미하는 바는 MainAxis는 진행방향 기준이고 CrossAixs는 다른 남은 방향을 말하는것이다. 둘 다 어느 위치에 둘것인가 style 정하는 클래스