import UIKit

class GamesListVC: UIViewController {

    
    @IBOutlet weak var chooseGameButton: MyButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //createButton.turnClickSoundOn(sound: K.Sounds.click)
        title = "Результаты"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGamesList" {
            let gameListTVC = segue.destination as? GameListTVC
        }
    }
}
