//
//  ViewController.swift
//  TextField
//
//  Created by 김정호 on 11/13/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        // 최초응답자 설정(responder) (뷰마다 특성이 조금 다름) (UIResponder)
        // 전체화면이 터치를 입력받을 수 있는 상태 ==> 텍스트필드가 가장 먼저 입력받는 상태
        // 키보드가 올라옴 (손가락 터치로 직접 최초응답자 설정도 가능)
        textField.becomeFirstResponder()
        //textField.resignFirstResponder()
    }

    // 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 시작되면 호출 (시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 텍스트필드 내용을 삭제할 때 호출 (삭제할지 말지를 물어보는 것)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드에 글자내용이 (한글자 한글자) 입력되거나 지워질때 호출 (허용할지 말지를 물어보는 것)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print("텍스트필드의 입력값: \(string)")
        
        // 입력되고 있는 글자가 "숫자"인 경우 입력을 허용하지 않는 논리
//        if Int(string) != nil {  // (숫자로 변환이 된다면 nil이 아닐테니)
//            return false
//        } else {
//            // 10글자이상 입력되는 것을 막는 코드
//            guard let text = textField.text else { return true }
//            let newLength = text.count + string.count - range.length
//            return newLength <= 10
//        }
        
        // 10글자이상 입력되는 것을 막는 코드 (또다른 구현법)
        if (textField.text?.count)! + string.count > 10 {
            return false
        } else {
            return true
        }
        
        //return true
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝날 때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        
        // 실제 텍스트필드에 아무것도 입력이 되어 있지 않으면, 입력을 끝내지 못하게
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
        // return true
    }
    
    // 텍스트필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 끝냈다.")
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        // self.view.endEditing(true)
    }
    
    // 화면에 탭을 감지(UIResponder)하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        // self.view.endEditing(true)
    }
}
