import UIKit
import RxSwift
import RxCocoa

/*
# Publish Subject
let subject = PublishSubject<String>()
subject.onNext("event 1")
subject.subscribe { (event) in
    print(event)
}
subject.onNext("event 2")
subject.onNext("event 3")
//subject.onCompleted()
subject.dispose()
subject.onNext("event 4")
*/

/*
# Behavior Subject
 let subject = BehaviorSubject(value: "initial value")
 subject.onNext("event 1")
 subject.subscribe {
     print($0)
 }
 subject.onNext("event 2")
 subject.dispose()
*/

/*
# Replay Subject
let subject = ReplaySubject<String>.create(bufferSize: 2)
subject.onNext("event 1")
subject.onNext("event 2")
subject.onNext("event 3")
subject.subscribe{
    print("subscribe 1: ", $0)
}
subject.onNext("event 4")
subject.onNext("event 5")
print("new subscriber")
subject.subscribe({
    print("subscribe 2: ", $0)
})
subject.onNext("event 6")
*/

/*
# Variable
let variable = Variable([""])
variable.value.append("Curry")
variable.value.append("Thomphson")
variable.asObservable().subscribe({
    print($0)
})
variable.value.append("Bryant")
*/


/*
# Behavior Relay
 let relay = BehaviorRelay(value: ["A"])
 relay.asObservable().subscribe{
     print($0)
 }
 relay.accept(relay.value + ["B"])
 var value = relay.value
 value.append("C")
 relay.accept(value)
*/



