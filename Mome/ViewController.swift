//
//  ViewController.swift
//  Mome
//
//  Created by VANTE on 10/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var numQuiz: UILabel!
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
   
    
    
    @IBOutlet weak var bgg: UIImageView!
    
    
    let allQuestion = QuestionAll()
    var pickedAnswer : Bool = false
    var score : Int = 0
    var countCorrect : Int = 0
    var countWrong : Int = 0
    
    var set = 0
    
    var questionNumber : Int = 0
    
    
    var randomImg : Int = 0
    
   // let ImgArray = ["i1","i2","i3","i4","i5","i6","i7","i8","i9","i10","i11","i12","i13","i14","i15","i16","i17","i18","i19","i20","i21","i22","i23","i24","i25","i26","i27","i28","i29","i30","i31","i32","i33","i34","i35"]
    
    
    var set2 = 1
    var timer = Timer()
    
    var time4 = 10
    
    @objc func processTimer() {
        print("เริ่มนับถอยหลัง")
        
        print(time4)
        
        if time4 > 0 {
            time4 -= 1;
            timeText.text = String(time4) //casting
        } else{
            timer.invalidate()
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }
    
    
    
    
    
    
    
    @IBAction func nextQuiz(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getter: ViewController.timeText), userInfo: nil, repeats: true)
        
        if time4 == 0{
            timer.invalidate()
            print("time run")
        }
        
        
    }
    
    
    @IBAction func choiceBt(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
        } else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
        }
        
                checkAnswer()
                questionNumber = questionNumber + 1
               // updateUI()
        
        
    }
    
    
    func checkAnswer() {
        // Local Variable ใช้เฉพาะในฟังก์ชันนี้
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("Correct")
            score = score + 1
            countCorrect = countCorrect + 1
            // ProgressHUD.showSuccess("Correct")
        }else{
            print("Wrong")
            countWrong = countWrong + 1
            //  ProgressHUD.showError("Wrong")
        }
    } //checkAnswer
    
    
//    func convertUIImageToString (image: UIImage) -> String {
//
//        var imageAsData: Data = image.pngData()!
//        var imageAsInt: Int = 0 // initialize
//
//        let data = NSData(bytes: &imageAsData, length: MemoryLayout<Int>.size)
//        data.getBytes(&imageAsInt, length: MemoryLayout<Int>.size)
//
//        let imageAsString: String = String (imageAsInt)
//
//        return imageAsString
//
//    }
    
    
    
    
    
    
    
    
    
    
    func nextQuestion() {
        
        //  var quizImage : UIImage = UIImage(named:"i4")!
        
        
        
        if questionNumber <= 34 {
            quizImage.image = allQuestion.list[questionNumber].questionImg
            
                    } else{
            
                        let alert = UIAlertController(title: "End Game", message: "เล่นจบคำถามแล้วจ้า คุณได้คะแนน \(score) คะแนน \n เล่นอีกรอบไหม", preferredStyle: .alert)
            
                        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {UIAlertAction in self.startOver()})
            
                        alert.addAction(restartAction)
            
                        present(alert, animated: true, completion: nil)
            
                    } // end else
        
    } // end nextQuestion
        
        
//        func changeImg() {
//
//
//            randomImg = Int(arc4random_uniform(35))
//
//            quizImage.image = UIImage(named:ImgArray[randomImg])
//
//
//        }
    
        
        
        func startOver() {
            questionNumber = 0
            score = 0
            countCorrect = 0
            countWrong = 0
            
            
            
        } // end startOver
    
    
    
    
    
    
    
    
    
    
    @IBAction func bgBt(_ sender: Any) {
        if set >= 0 {
            bgg.image = UIImage(named: "bg1")
            print("1")
        }
    } // bgBt
    
    
    @IBAction func reset(_ sender: Any) {
        if set == 0 {
            bgg.image = UIImage(named: " ")
    }
} // reset
    
    
    
    
    
    



}


