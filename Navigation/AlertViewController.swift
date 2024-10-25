import UIKit

struct Alert{
    let title: String
}

class AlertController: UIAlertController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .purple
    }
}

