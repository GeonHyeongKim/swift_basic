# TabBar Controller : UITabBar와 UITabItem으로 구성

## 1. 탭 바에서의 접근은 모두 Controller통해 접근함
- tabBar : tabBarController.tabBar. (barTintColor)
    - backgroundImage : 탭 바 전체에 적용되는 배경이미지
    - selectionIndicatorImage : 현재 이 탭이 선택되어 있음을 알려주는 이미지
- item : tabBarController.tabBar.item
    - image : 탭이 선택되지 않은 상태일 때 표시될 아이콘 이미지
    - selectedImage : 탭이 선택된 상태일 때, 표시될 아이콘 이미지
    - titleTextAttribute : 탭 바 아이템의 아이콘 이미지 아래에 표시될 텍스트 속성
 
 ※ 네비게이션 컨트롤러는 다름
  - bar에 접근 : navigationController -> navigationBar
  - item에 접근 : navigationItem( 종류 : titleView, leftBarButton, rightBarButton)
  
## 2. 탭바 커스텀 - storyboard 사용 + 프로그래밍적 접근
### 1) storyboard
![Relationship Segue - view controllers 선택하여 연결](https://user-images.githubusercontent.com/48436020/100585429-ee09d280-3330-11eb-8db0-1c1db1a3f9b0.png)

### 2) 탭 바 생성
#### [tabBar 화면 전환방식]
![tabBar 화면 전환방식 문제](https://user-images.githubusercontent.com/48436020/100687945-97e66f00-33c4-11eb-9d75-1c7e6b26507e.png)

```swift


```

