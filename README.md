# 2024-NC2-A29-CallKit
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About CallKit

### CallKit이란?

VoIP 서비스에 대한 시스템 전화 UI와 통화 관련 서비스들을 앱에 제공하는 프레임워크 입니다.

뿐만 아니라 앱의 전화와 시스템 또는 다른 앱의 전화들을 조정해주는 역할을 합니다. 예를들어 앱이 전화 발신을 하고 있는 중에 다른 전화가 오면 전화를 홀드 시켜주고 어떤 전화를 선택할건지에 대한 지원 여부와 그에 해당하는 UI를 보여줍니다.

<br/>

### Feature List

- 통화 인터페이스 통합
- 통화 기록 제공
- 발신자 식별 및 차단
- CarPlay 지원
- 방해 금지 모드 또는 잠자기 모드 등 시스템 설정에 대한 대응

<br/>

### Incoming Call

![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/16b0a688-fc97-4f27-bbe0-6510bad6ffc1)

1. 서버에서 APNS로 Push Notification 요청
2. APNS는 서버에서 받은 데이터(Device token, Device identifier)를 바탕으로 영희의 핸드폰에 Voip Push Notification 전송
3. 앱은 PushKit을 사용해 Voip Push Notification 처리, 여기서 받은 정보에서 uuid caller의 대한 정보를 추출해 **CXCallUpdate** 객체 생성!

![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/43df1522-9a99-401c-be21-1fee84e77b20)

4. **CXProvider** 를 통해 CallKit에게 새로운 전화가 왔다는 UI 요청 (앱과 시스템 사이의 중간다리 역할)
5. **CXProviderDelegate** 를 사용해 통화 수락 이벤트가 왔을때 전화 연결 진행

<br/>

### Custom UI

앱의 UI로 통화 조작이 가능합니다! with **CXCallController**

![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/ca81b79c-9a6f-4576-a591-ea2173c4f01e)

1. Call 과 관련된 행동을 **CXTransaction** 객체로 만들어 **CXProvider**에게 처리해 달라고 요청이 가능
2. 그러면 **CXProvider**는 앱이 구현한 **CXProviderDelegate** 메소드를 실행함
3. CXTransaction → CXCallController → CXProvider → CXProviderDelegate

<br/>

## 🎯 What we focus on?

### 시스템 호출 UI 표시와 다른 앱과의 일원화

- 가짜 전화를 만들어 제공할 수 있다.
- 시스템에서 제공하는 UI를 사용함으로써 리얼한 전화로 인식이 가능하다.
- 그럼 우리가 아침에 모닝콜을 앱에서 해주면서 미라클 모닝을 도와주자!

### 통화와 관련된 커스텀 UI 제공

- 통화와 관련된 액션(스피커 모드, 전화 끊기, 키패드 등등)을 커스텀 UI로 만들 수 있다.
- 그럼 확실하게 잠을 깨워주기 위해서 통화 화면에 전화 끊기를 없애자!
- 그리고 받아쓰기가 완료될 때 까지 통화를 끊지 못하게 만들자!

<br/>

## 💼 Use Case

![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/149c1523-22ee-4d0f-adf7-3ba5e1501f90)

<br/>
## 🖼️ Prototype

![image](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/a98f3f97-71ac-47c1-b494-3c2f4aee052a)

1. 초기 화면에서 3가지 목소리 중 아침에 듣고 싶은 사람을 선택하세요!
2. 목소리 변경을 통해 언제나 바꿀 수 있습니다!
3. 아침 6시 30분이 되면 모닝콜이 옵니다.
4. 전화를 받으면 오늘의 명언 받아쓰기가 끝날 때 까지 통화 종료를 하지 못합니다!
5. 받아쓰기가 완료되면 축하 메시지와 함께 통화가 종료됩니다.

<br/>

## 🛠️ About Code

### CallKit

```swift
// in CXProviderDelegate

// Provider에서 통화버튼을 눌렀을 때 실행되는 메소드
func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    isCallComing = true
    self.audio.startAudio()
    
    // 통화 실행
    action.fulfill()
}

// Provider에서 통화 종료 버튼을 눌렀을 때 메소드,
func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    isCallComing = false
    self.isTest = false
    self.audio.stopAudio()
    
    // 통화 종료
    action.fulfill()
}
```

**CXTransaction** 객체를 통해 커스텀 버튼 제작 가능!


```swift
public func endCall() {
    let endCallAction = CXEndCallAction(call: self.id!)
    let transaction = CXTransaction(action: endCallAction)
    
    callController.request(transaction) { error in
        if let error = error {
            print("cancel failed, \(error.localizedDescription)")
        }
    }
}
```

<img src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/830e9f24-de8d-4016-9bd0-9e956615718b" width="25%" height="25%"/>

이렇게~


<br/>

### PushKit

```swift
import PushKit

class CallViewModel: NSObject {
    private override init() {
        super.init()
        
        // PushKit 등록 -> voip push를 받기 위해서 사용함
        let registry = PKPushRegistry(queue: nil)
        registry.delegate = self
        registry.desiredPushTypes = [.voIP]
    }
}
```


```swift
// in PKPushRegistryDelegate, voip push알림을 받았을 때 실행되는 메소드
// 여기서 voip통화를 연결 시킴 with CallKit
func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
    // CXProviderConfiguration을 통해 통화 옵션을 설정할 수 있다.
    let config = CXProviderConfiguration()
    config.includesCallsInRecents = true
    config.supportsVideo = false
    
    let provider = CXProvider(configuration: config)
    provider.setDelegate(self, queue: nil)

    // CXCallUpdate 객체를 통해 새로운 전화를 생성한다.
    let update = CXCallUpdate()
    update.remoteHandle = CXHandle(type: .generic, value: selectedVoice)
    update.hasVideo = false
    
    self.id = UUID()
    
    // uuid와 CXCallUpdate로 발신자 정보 표시
    // provider에게 새로운 전화가 왔음을 알린다.
    provider.reportNewIncomingCall(with: self.id!, update: update) { error in
        if let error = error {
            fatalError(error.localizedDescription)
        }
    }
}
```

### Configure 프로퍼티 종류

<img width="687" alt="image" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/40598709-115b-492d-85a0-9d4b57d9a844">

<img width="722" alt="image" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A29-CallKit/assets/116792524/24898173-9473-4389-9829-b08e60eea1b7">

벨소리 지정, 앱 이미지, 최근 전화 목록 추가 여부 등등 다양한 것을 설정할 수 있습니다.

- ringtoneSound : 벨소리 지정
- iconTemplateImageData : 통화화면에 나오는 앱 이미지 수정
- maximumCallGroups : 최대 Call group 수
- maximumCallsPerCallGroup : Call group당 최대 Call 갯수
- supportedHandleTypes : 모르겠습니다...
- supportsVideo : 비디오 사용 여부(페이스타임 같은 것)
- includesCallsInRecents : 내장 전화 앱에 통화 기록 포함 여부
