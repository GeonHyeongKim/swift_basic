# TabBar Controller : UITabBar와 UITabItem으로 구성

탭 바에서의 접근은 모두 Controller통해 접근함
 - tabBar : tabBarController.tabBar. (barTintColor)
 - item : tabBarController.tabBar.item
 
 ※ 네비게이션 컨트롤러는 다름
  - bar에 접근 : navigationController -> navigationBar
  - item에 접근 : navigationItem( 종류 : titleView, leftBarButton, rightBarButton)
