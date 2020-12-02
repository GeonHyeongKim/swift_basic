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
#### ※ tabBar 화면 전환방식
![tabBar 화면 전환방식 문제](https://user-images.githubusercontent.com/48436020/100687945-97e66f00-33c4-11eb-9d75-1c7e6b26507e.png)

#### ※ SceneDelegate.swift에 초기화 하기

```swift
// SceneDelegate.swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    // 루트 뷰 컨트롤러를 UITabBarController로 캐스팅
    if let tbc = self.window?.rootViewController as? UITabBarController {
        
        // 현재 선택된 아이템 색깔 지정
        tbc.tabBar.tintColor = .green
        
        // 탭바의 색깔
        tbc.tabBar.barTintColor = .blue
        
        // 탭바에 이미지 삽입 방법 (backgoundImage는 색상이 잘 표현 안되는 경우가 생겨서 tint로 사용할 것)
        tbc.tabBar.barTintColor = UIColor(patternImage: UIImage(named: "menubar-bg-mini")!)
        
        // bacgroundImage의 장접은 신축성 옵션이 가능
        tbc.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini") // 이미지 크기가 작다면 바둑판형태
        tbc.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16) // 좌표를 기준으로 늘이기
        tbc.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0) // 균일하게 늘이기
        
        // 큰 이미지 자르기: 이미지가 tabBar보다 큰 경우 밖으로 튀어나옴
        tbc.tabBar.clipsToBounds = true
        
        // 탭 바로부터 탭 바 아이템 배열을 가져온다.
        if let tbItems = tbc.tabBar.items {
            tbItems[0].image = UIImage(named: "calendar.png")
            tbItems[1].image = UIImage(named: "file-tree.png")
            tbItems[2].image = UIImage(named: "photo.png")
            
            tbItems[0].title = "calendar"
            tbItems[1].title = "file"
            tbItems[2].title = "photo"
            
            // 원본 이미지 적용하기 (탭바의 이미지 디폴트는 색상은 무시되고 단순히 alpha값만 사용함)
            let image = UIImage(named: "calendar.png")?.withRenderingMode(.alwaysOriginal)
            tbItems[0].image = image
            
            // 탭바 아이템의 타이틀 설정
            for tbItem in tbItems {
                tbItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .disabled)
                tbItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
            }
            
            // proxy객체 사용 : for문으로 접근하지 않아도 가능
            // 탭바 아이템에 일일이 할 필요 없이, 일괄적 적용
            let tbItemProxy = UITabBarItem.appearance()
            tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], for: .selected)
            tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.gray], for: .disabled)
            tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
        }
        
    }
    
    guard let _ = (scene as? UIWindowScene) else { return }
}
    
    ...(중략)...
```
<center><img src="https://user-images.githubusercontent.com/48436020/100831829-dd309c80-34a9-11eb-8010-ce868ca894b0.png" width="60%"></center>

![tabBar 화면 전환방식 문제 해결 - SceneDelegate]()
- 앱 실행시 모두 초기화가 가능하도록 SceneDelegate에 작성할 것 
- 탭바의 이미지 아이콘 사이즈는 apple에서 정해져 있음 (너무 클시 튀어나오는 경우 발생)

### 3) 탭바 아이템 접근하기
 - 인덱스로 접근 : self.tabBarController?.tabBar.items?[0]
 ```swift
var firstItem = self.tabBarController?.tabBar.items?[0]
    firstItem?.image = UIImage(named: "calendar.png")
    firstItem?.title = "calendar"
 ```
