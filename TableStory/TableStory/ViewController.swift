import UIKit

// Define the data model for items in the table view
struct Item {
    var name: String
    var neighborhood: String
    var desc: String
    var lat: Double
    var long: Double
    var imageName: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = [
        Item(name: "Flowers Hall", neighborhood: "Texas State University Campus", desc: "A historic campus building with quiet study areas and nearby greenspaces.", lat: 29.889057106627064, long: -97.94024557510834, imageName: "flowershall"),
        Item(name: "Albert B. Alkek Library", neighborhood: "Texas State University Campus", desc: "A multi-level library packed with study nooks and creative spaces.", lat: 29.889664752388345, long: -97.94289662026559, imageName: "alkek"),
        Item(name: "New Braunfels Coffee", neighborhood: "489 Main Plaza, New Braunfels, TX 78130", desc: "A cozy coffee shop that is perfect for getting work done!", lat: 29.70377900090141, long: -98.12471149768001, imageName: "nbcafe"),
        Item(name: "San Marcos River", neighborhood: "650 River Rd, San Marcos, TX 78666", desc: "Discover a outdoor escape with shaded areas perfect for working outdoors!", lat: 29.91326623826592, long: -97.93792334153291, imageName: "park"),
        Item(name: "How to Find the Right Spot", neighborhood: "your home", desc: "Find your ideal work spot at home or in your backyard!", lat: 0, long: 0, imageName: "korte.backyard")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theTable", for: indexPath)
        let item = data[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.neighborhood
        cell.imageView?.image = UIImage(named: item.imageName)
        if let imageView = cell.imageView {
            let image = UIImage(named: item.imageName)
            imageView.image = image
            imageView.layer.cornerRadius = 10
            imageView.layer.borderWidth = 5
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.clipsToBounds = true // Ensures rounded corners are visible
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.row]
        performSegue(withIdentifier: "ShowDetailSegue", sender: selectedItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            if let selectedItem = sender as? Item, let detailViewController = segue.destination as? DetailViewController {
                // Pass the selected item to the detail view controller
                detailViewController.item = selectedItem
            }
        }
    }
    
}
    
