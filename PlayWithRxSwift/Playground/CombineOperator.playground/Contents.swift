import UIKit
import RxSwift

let disposeBag = DisposeBag()

/*concat
 let first = Observable.of(1, 2, 3)
 let second = Observable.of(4, 5, 6)

 let observable = Observable.concat([first, second])
 observable.subscribe(onNext: {
     print($0)
 }).disposed(by: disposeBag)
 */

/*merge
 let first = PublishSubject<Int>()
 let second = PublishSubject<Int>()

 let source = Observable.of(first.asObservable(), second.asObservable())
 let observable = source.merge()
 observable.subscribe(onNext: {
     print($0)
 }).disposed(by: disposeBag)

 first.onNext(5)
 first.onNext(10)
 second.onNext(3)
 first.onNext(15)
 second.onNext(6)
 second.onNext(9)
 */

/*combineLatest
 let first = PublishSubject<Int>()
 let second = PublishSubject<Int>()
 let observable = Observable.combineLatest(first, second) { (firstVal, secondVal) in
     "\(firstVal) - \(secondVal)"
 }

 observable.subscribe(onNext: {
     print($0)
 }).disposed(by: disposeBag)

 first.onNext(1)
 first.onNext(3)
 first.onNext(5)
 first.onNext(7)
 first.onNext(9)
 second.onNext(2)
 second.onNext(4)
*/

/*withLatestFrom
 let button = PublishSubject<Void>()
 let textField = PublishSubject<String>()

 let observable = button.withLatestFrom(textField)
 observable.subscribe(onNext: {
     print($0)
 }).disposed(by: disposeBag)

 textField.onNext("H")
 textField.onNext("He")
 textField.onNext("Hel")
 button.onNext(())
 textField.onNext("Hell")
 textField.onNext("Hello")
 button.onNext(())
 */

/*reduce
 let source = Observable.of(11, 30, 24)
 source.reduce(0, accumulator: { (sum, newVal) in
     return sum + newVal
 }).subscribe(onNext: {
     print($0)
 }).disposed(by: disposeBag)
 */

/*scan*/
let source = Observable.of(11, 30, 24)
source.scan(0, accumulator: { (sum, newVal) in
    return sum + newVal
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
