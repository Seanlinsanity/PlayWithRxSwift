import UIKit
import RxSwift


let disposeBag = DisposeBag()
let strikes = PublishSubject<String>()
strikes.onNext("X")
strikes.ignoreElements()
    .subscribe {
        print("subscription is fired: ", $0)
    }.disposed(by: disposeBag)


strikes.elementAt(2)
    .subscribe { (event) in
        print("element at subscription is fired: ", event)
    }.disposed(by: disposeBag)

strikes.onNext("S")
strikes.onNext("S")
strikes.onNext("B")
strikes.onNext("B")
strikes.onNext("S")
strikes.onCompleted()


Observable.of(1, 2, 3, 4, 5, 6, 7, 8)
    .filter({ $0 % 2 == 0})
    .subscribe(onNext: {
        print("filter: ", $0)
    }).disposed(by: disposeBag)


Observable.of(1, 2, 3, 4, 5, 6, 7, 8)
    .skip(5)
    .subscribe(onNext: {
        print("skip: ", $0)
    }).disposed(by: disposeBag)

Observable.of(2, 2, 3, 4, 4, 6)
    .skipWhile({ $0 % 2 == 0})
    .subscribe(onNext: {
        print("skipWhile: ", $0)
    }).disposed(by: disposeBag)

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()
subject.skipUntil(trigger)
    .subscribe(onNext: {
        print("skipUntil: ", $0)
    }).disposed(by: disposeBag)
subject.onNext("A")
subject.onNext("B")
subject.onNext("C")
trigger.onNext("X")
subject.onNext("D")

Observable.of(1, 2, 3, 4, 5, 6)
    .take(5)
    .subscribe(onNext: {
        print("take: ", $0)
    }).disposed(by: disposeBag)

Observable.of(2, 4, 6, 7, 3, 8, 10)
    .takeWhile({ $0 % 2 == 0 })
    .subscribe(onNext: {
        print("takeWhile: ", $0)
    }).disposed(by: disposeBag)
