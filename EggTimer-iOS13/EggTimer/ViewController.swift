import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
    
     let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            print(Float(secondsPassed) / Float(totalTime) )
            
            secondsPassed += 1
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!!"
        }
    }
}
