# TabBar Controller : UITabBar와 UITabItem으로 구성

탭 바에서의 접근은 모두 Controller통해 접근함
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
