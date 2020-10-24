import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

/*
 toArray
Observable.of(1, 2, 3, 4, 5)
     .toArray()
     .subscribe(onNext: {
         print("to array: ", $0)
     }).disposed(by: disposeBag)
 */

/*
 map
 Observable.of(1, 2, 3, 4, 5)
     .map{ $0 * 2 }
     .subscribe(onNext: {
         print("map: ", $0)
     }).disposed(by: disposeBag)
 */

struct Student {
    var score: BehaviorRelay<Int>
    var name: String
}

let curry = Student(score: BehaviorRelay(value: 60), name: "Curry")
let thomphson = Student(score: BehaviorRelay(value: 80), name: "Thomphson")

let student = PublishSubject<Student>()
//student.asObservable()
//    .flatMap({$0.score})
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)

student.asObservable()
    .flatMapLatest({ (student) -> Observable<Int> in
        print("flat map...")
        return student.score.asObservable()
    })
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


student.onNext(curry)
curry.score.accept(70)
curry.score.accept(100)
//student.onNext(thomphson)
//thomphson.score.accept(30)
//curry.score.accept(95)



