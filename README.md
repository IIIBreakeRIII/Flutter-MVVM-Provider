### MVVM Pattern

#### 1. MVVM 패턴의 정의
MVVM 패턴은 Model, View, View-Model로 이루어진 디자인 패턴이다.  
Wikipedia에 따르면, 다음과 같이 정의하고 있다.  

> Model–view–viewmodel (MVVM) is an architectural pattern in computer software that facilitates the separation of the development of a graphical user interface (GUI; the view)—be it via a markup language or GUI code—from the development of the business logic or back-end logic (the model) such that the view is not dependent upon any specific model platform.

즉, 클라이언트 GUI 영역에 해당하는 뷰와 백엔드 혹은 비즈니스 로직에 해당하는 모델을 분리하여 개발하기 위한 디자인 패턴으로, 뷰가 특정 모델 혹은 데이터와 독립적으로 작동하며 서로 영향을 끼치지 않게 하는 것을 목적으로 한다.

#### 2. MVVM 패턴의 구성
MVVM 패턴은 다음과 같이 3가지 요소로 구성된다.  

- Model : 데이터 구조를 정의하고 View Model에게 결과를 알려준다. 때문에, Model과 View는 서로 이어질 수 없다.
- View : 사용자와 상호작용을 통해 이벤트가 발생되며, View Model에게 이를 알려주고, View Model에게 의뢰한 업데이트 결과를 받아 화면에 반영해준다.
- View Model : 사용자와의 상호작용을 View가 보내주면 그에 맞게 이벤트를 처리하고, Model의 Read, Update, Delete를 담당한다.

#### 3. MVVM 패턴과 MVC패턴의 차이
기존 MVC 패턴의 View와 Controller는 다음과 같은 역할을 수행한다.
- View : Just Dummy. UI적인 표현만 하며, UI에 대한 모든 Control은 Controller가 관장한다.
- Controller : View Source에 대한 모든 Interaction 및 Model과의 데이터 전송까지 관장

하지만, MVVM 패턴의 View와 View Model은 다음과 같은 역할을 수행한다.
- View : UI적인 표현과 함께 View Model의 기능을 통한 Interaction까지 관장
- View Model : View에서 사용되는 기능들의 함수적인 기능만 제공

즉 MVC 패턴은 Controller가 중재자로 View와 Model을 연결하고, 모든 View에 대한 행위 및 상태를 관장하기에 자연스럽게 의존성이 높아지는 형태를 띈다.  
하지만, MVVM 패턴의 경우 View Model은 View와 Model을 연결만 할 뿐, 자체적인 의존성은 존재하지 않는다. 때문에 더 독립적인 View와 Model을 구성할 수 있다.

#### 4. Flutter의 State관리
어떤 플랫폼이던, Client단에서의 상태 관리는 매우 중요하다.  
데이터를 서로간의 클래스에서 공유할 때, 혹은 이러한 데이터를 최신화 하거나 새로운 데이터로 전환이 필요할 때, 이러한 상태 관리는 필수적으로 작용한다.  
이러한 Flutter의 상태 관리는 때문에 주로 Provider를 이용하게 되고, 다음과 같은 장점을 띈다.

- 리소스의 할당 및 해제의 간결화
- Lazy Loading
- 관심사의 분리 및 코드의 간결화

다음은 [Provider](https://pub.dev/packages/provider)의 공식 문서이다.  

해당 레포지토리에서는 이러한 MVVM 패턴과 Provider를 사용하여 애플리케이션을 제작하였다.

#### 5. Code Review
1. [`main.dart`](https://github.com/IIIBreakeRIII/Flutter-MVVM-Provider/blob/main/lib/main.dart)
    - 애플리케이션의 진입점으로, `NumberPage()`가 작동되도록 한다.
2. [`number_page.dart`](https://github.com/IIIBreakeRIII/Flutter-MVVM-Provider/blob/main/lib/providers/number_page.dart)
    - `StatelessWidget`을 상속받으며, `MultiProvider`를 반환한다.
        - `MultiProvider`란, 여러 Provider를 한번에 사용할 수 있도록 해주는 Provider이다.
    - `ChangeNotifierProvider`는 어떠한 이벤트가 발생하거나 위젯이 종료될 때 어떻게 이를 처리할지 결정하는 `ProviderListener` 프로토콜을 이용한 `ChangeNotifier`의 행동을 모두 감지한다.
    - 해당하는 `NumberPage`클래스는 결국, 이러한 `NumberViewModel()`와 `NumbereView()`에게 상태를 `create`하도록 지시한다.
3. [`number_view.dart`](https://github.com/IIIBreakeRIII/Flutter-MVVM-Provider/blob/main/lib/views/number_view.dart)
    - MVVM 패턴의 View에 해당한다.
    - `StatelessWidget`을 상속받으며, `NumberViewModel`을 이용하여 `Number`를 가져온다.
    - `Number`를 가져온 후, `Number`를 화면에 출력한다.
    - 여기에서 `_numberViewModel`은 기본적으로 상태의 변화에 대해서 `NumberViewModel`의 리스너로 설정되어 있지 않다.
    - 하지만, 필요에 따라서 즉 상태의 변화가 필요한 경우, `Consumer`를 이용하여 해당하는 부분만 상태를 받아올 수 있도록 지시한다.
4. [`number_view_model.dart`](https://github.com/IIIBreakeRIII/Flutter-MVVM-Provider/blob/main/lib/viewmodels/number_viewmodel.dart)
    - MVVM 패턴의 View Model에 해당한다.
    - `ChangeNotifier`를 상속받아, `Number`를 가져오고, `Number`를 업데이트하는 함수를 정의한다.
        - `ChangeNotifier`는 위젯에 listen값을 알려주고, `notifyListeners()`를 호출하여 위젯에게 상태의 변화를 알려준다.
5. [`number.dart`](https://github.com/IIIBreakeRIII/Flutter-MVVM-Provider/blob/main/lib/models/number.dart)
    - MVVM 패턴의 Model에 해당한다.
    - `Number`라는 클래스를 정의하고, `Number`를 생성하고, 업데이트하는 함수를 정의한다.

#### 6. References
- [Wikipedia - MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)
- [Provider - Flutter](https://pub.dev/packages/provider)
