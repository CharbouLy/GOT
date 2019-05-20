import UIKit
import Alamofire

class HousesViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        requestHouses()
    }
    
    func requestHouses() {
        Alamofire.request("https://api.got.show/api/book/houses").responseData { (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                success(value)
                print(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell_ID", for: indexPath)
        return cell
    }
}
