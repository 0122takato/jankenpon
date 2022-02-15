//
//  ViewController.swift
//  W0102
//
//  Created by 新谷威人 on 2021/06/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController ,AVAudioPlayerDelegate{
    var jankenponPlayer:AVAudioPlayer!
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        let audioPath = Bundle.main.path(forResource:"jankenpon", ofType: "mp3")!
        let jankenponUrl = URL(fileURLWithPath: audioPath)

        do {
            jankenponPlayer = try AVAudioPlayer(contentsOf: jankenponUrl)
        }catch let error as NSError {
            print(error.code)
        }
        
        jankenponPlayer.delegate = self
        
    }
    @IBOutlet weak var anserImageView: UIImageView!
    @IBOutlet weak var anserLabel: UILabel!
    var newAnserNumber:UInt32 = 0
    var anserNumber:UInt32 = 0

    @IBAction func buttonClick(_ sender: Any) {

        jankenponPlayer.play()
        }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        //音が鳴り終わってからの処理 

        anserNumber=arc4random_uniform(3)
        repeat {
            anserNumber = arc4random_uniform(3)
        }
        while newAnserNumber == anserNumber
            newAnserNumber = anserNumber
        switch newAnserNumber {
        case 0:
            anserLabel.text="グー"
            anserImageView.image=UIImage(named: "gu")
            
        case 1:
            anserLabel.text="チョキ"
            anserImageView.image=UIImage(named: "choki")
        case 2:
            anserLabel.text="パー"
            anserImageView.image=UIImage(named: "pa")
        default:break
        
        }

    }

}

