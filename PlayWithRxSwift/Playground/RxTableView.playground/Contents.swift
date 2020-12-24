import UIKit
import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class SimpleTableViewExampleSectionedViewController: UIViewController, UITableViewDelegate {
    var tableView = UITableView(frame: .zero, style: .grouped)
    let disposeBag = DisposeBag()
    let name: String = "Sean"
    let items = Observable.just([
        SectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
            ]),
        SectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
            ]),
        SectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
            ])
        ])

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.frame = view.frame
        print("view did load")

        items
            .bind(to: tableView.rx.items(dataSource: self.makeDataSource()))
            .disposed(by: disposeBag)

        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func makeDataSource() -> RxTableViewSectionedReloadDataSource<SectionModel<String, Double>>{
        return RxTableViewSectionedReloadDataSource<SectionModel<String, Double>>(
            configureCell: { [weak self] (_, tv, indexPath, element) in
                let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element) @ row \(indexPath.row)"
                print(self?.name)
                return cell
            },
            titleForHeaderInSection: { dataSource, sectionIndex in
                return dataSource[sectionIndex].model
            }
        )
    }

    // to prevent swipe to delete behavior
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    deinit {
        print("deinit vc...")
    }
}

var rootViewController: UIViewController? = SimpleTableViewExampleSectionedViewController()
rootViewController?.title = "RxSwift TableView Binding"

var navigationController: UINavigationController? = UINavigationController(rootViewController: rootViewController!)
navigationController?.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
PlaygroundPage.current.liveView = navigationController?.view

navigationController = nil
rootViewController = nil
