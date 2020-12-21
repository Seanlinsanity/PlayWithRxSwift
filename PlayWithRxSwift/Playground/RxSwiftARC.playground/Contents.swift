import UIKit
import RxSwift
import RxCocoa

var str = "Hello, playground"
let relay = BehaviorRelay(value: ["preA"])
var disposeBag: DisposeBag? = DisposeBag()

class MyView {
    let key = "myKey"
    
    func subscribeCreateObservable() {
        let observableStr = Observable<String>.create { observer in
            DispatchQueue.global(qos: .background).async {
                observer.onNext("H")
                observer.onNext("i")
                observer.onNext("!")
                print(self.key)
            }
            return Disposables.create {
                print("disposable create")
            }
        }
        
        observableStr.subscribe(onNext: {
            print("next: " , $0)
        }, onError: {
            print("error: ", $0)
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        }).disposed(by: disposeBag!)
    }
    
    func SubscribeBehaviorRelay() {
        relay.accept(relay.value + ["A"])
        relay.asObservable().subscribe{
            print($0)
            print(self.key)
        }
        relay.accept(relay.value + ["B"])
        var value = relay.value
        value.append("C")
        relay.accept(value)
    }
    
    deinit {
        print("deinit vm...")
    }
}

var vm: MyView? = MyView()
//vm?.subscribeCreateObservable()
vm?.SubscribeBehaviorRelay()
vm = nil
disposeBag = nil
