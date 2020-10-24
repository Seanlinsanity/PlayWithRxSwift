//
//  ViewController.swift
//  PlayWithRxSwift
//
//  Created by Sean on 2020/10/1.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map({self.cityTextField.text})
            .subscribe(onNext: { [weak self] city in
                if let city = city {
                    print("search: ", city)
                    if city.isEmpty {
                        self?.displayWeather(nil)
                    } else {
                        self?.fetchWeather(by: city)
                    }
                }
            })
            .disposed(by: disposeBag)
        
//        cityTextField.rx.value
//            .subscribe(onNext: { [weak self] city in
//                if let city = city {
//                    print("search: ", city)
//                    if city.isEmpty {
//                        self?.displayWeather(nil)
//                    } else {
//                        self?.fetchWeather(by: city)
//                    }
//                }
//            }).disposed(by: disposeBag)
    }
    
    private func fetchWeather(by city: String) {
        
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityEncoded)&appid=11b275fdde3484c5e73994b7e2aa6029") else {
            return;
        }
        
        let resource = Resource<WeatherResult>(url: url)
        URLRequest.load(resource: resource)
            .catchErrorJustReturn(WeatherResult(main: Weather(temp: 0, humidity: 0)))
            .subscribe(onNext: { result in
                let weather = result.main
                self.displayWeather(weather)
            }).disposed(by: disposeBag)
    }

    private func displayWeather(_ weather: Weather?) {
        DispatchQueue.main.async {
            if let weather = weather {
                self.tempLabel.text = "\(weather.temp) degree"
                self.humidLabel.text = "\(weather.humidity) 💧"
            } else {
                self.tempLabel.text = "🙈"
                self.humidLabel.text = "❌"
            }
        }
    }
}

