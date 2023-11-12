//
//  ViewController.swift
//  Timer
//
//  Created by 김정호 on 11/12/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(slider.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때마다 무언가를 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복을 하고 싶은 코드
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                // 소리를 나게 해야됨
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
        
        // 슬라이더의 가운데 설정
        // slider.setValue(0.5, animated: true)
    }
}
