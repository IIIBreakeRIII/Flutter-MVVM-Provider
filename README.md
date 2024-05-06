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
일반적으로 Flutter도 동일한데, 주로 Flutter에서는 Provider 혹은 BloC 패턴을 이용하여 상태 관리를 진행한다.  
그 중, 가장 대표적인 Provider는 다음과 같이 구성된다.
