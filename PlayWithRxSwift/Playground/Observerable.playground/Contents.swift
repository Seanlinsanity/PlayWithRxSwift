import UIKit
import RxSwift

print("hello from RxSwift playground")

/*
# Observable
let observable1 = Observable.just(1)
let observable2 = Observable.of(1, 2, 3)
let observable3 = Observable.of([1, 2, 3], [9, 10])
let observable4 = Observable.from([1, 2, 3, 4, 5])

observable2.subscribe { (event) in
    if let element = event.element {
        print("2: ", element)
    }
}

observable3.subscribe { (event) in
    if let element = event.element {
        print("3: ", element)
    }
}

observable4.subscribe { (event) in
    if let element = event.element {
        print("4: ", element)
    }
}

observable4.subscribe(onNext: { element in
    print("4: ", element)
})
*/

// disposing
let disposeBag = DisposeBag()
Observable.of("A", "B", "C")
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

let observableStr = Observable<String>.create { observer in
    print("begin create")
    observer.onNext("H")
    observer.onNext("i")
    print("before completed")
    observer.onCompleted()
    print("after completed")
    observer.onNext("!")
    print("end create")
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
}).disposed(by: disposeBag)





