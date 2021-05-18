//
//  LoginFormController.swift
//  Weather
//
//  Created by Victor Garitskyu on 07.12.2020.
//

import UIKit

class LoginFormController: UIViewController {
    @IBOutlet weak var logintext: UILabel!
    @IBOutlet weak var passwordtext: UILabel!
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var scrol: UIScrollView!
      
    
    @IBOutlet weak var passwordinput: UITextField!
    @IBOutlet weak var logininput: UITextField!
    @IBAction func Loginbuttonn(_ sender: Any) {
       
    }
          
    //
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            // Проверяем данные
            let checkResult = checkUserData()
            
            // Если данные не верны, покажем ошибку
            if !checkResult {
                showLoginError()
            }
            
            // Вернем результат
            return checkResult
        }
        
        func checkUserData() -> Bool {
            guard let login = logininput.text,
                let password = passwordinput.text else { return false }
            
            if login == "admins 1312" && password == "123456" {
                return true
            } else {
                return false
            }
        }
        
        func showLoginError() {
            // Создаем контроллер
            let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
            // Создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // Добавляем кнопку на UIAlertController
            alter.addAction(action)
            // Показываем UIAlertController
            present(alter, animated: true, completion: nil)
        }

      override func viewDidLoad() {
          super.viewDidLoad()
          let hideKeyboardGesture = UITapGestureRecognizer(target: self,
                                                           action: #selector(hideKeyboard))
          scrol?.addGestureRecognizer(hideKeyboardGesture)

      }
      
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          NotificationCenter.default.addObserver(self,
                                                 selector: #selector(self.keyboardWasShown),
                                                 name: UIResponder.keyboardWillShowNotification,
                                                 object: nil)
          NotificationCenter.default.addObserver(self,
                                                 selector: #selector(self.keyboardWillBeHidden(notification:)),
                                                 name: UIResponder.keyboardWillHideNotification,
                                                 object: nil)
      }
      
      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          NotificationCenter.default.removeObserver(self,
                                                    name: UIResponder.keyboardWillShowNotification,
                                                    object: nil)
          NotificationCenter.default.removeObserver(self,
                                                    name: UIResponder.keyboardWillHideNotification,
                                                    object: nil)

      }
      
      override func viewDidDisappear(_ animated: Bool) {
          super.viewDidDisappear(animated)
      }
      
      
      // Когда клавиатура появляется
      @objc func keyboardWasShown(notification: Notification) {
          // Получаем размер клавиатуры
          let info = notification.userInfo! as NSDictionary
          let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
          let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
          
          // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
          scrol.contentInset = contentInsets
          scrol.scrollIndicatorInsets = contentInsets
      }
      
      //Когда клавиатура исчезает
      @objc func keyboardWillBeHidden(notification: Notification) {
          // Устанавливаем отступ внизу UIScrollView, равный 0
          let contentInsets = UIEdgeInsets.zero
          scrol.contentInset = contentInsets
      }
      
      @objc func hideKeyboard() {
          self.scrol?.endEditing(true)
      }

    
}

    
