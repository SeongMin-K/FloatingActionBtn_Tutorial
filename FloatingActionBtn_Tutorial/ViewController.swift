//
//  ViewController.swift
//  FloatingActionBtn_Tutorial
//
//  Created by SeongMinK on 2021/10/15.
//

import UIKit
import JJFloatingActionButton

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, "called")
        
        // 오른쪽 플로팅 액션 버튼
        let actionBtn = JJFloatingActionButton()
        
        actionBtn.buttonColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

        actionBtn.addItem(title: "추천", image: UIImage(systemName: "hand.thumbsup.fill")?.withRenderingMode(.alwaysTemplate)) { item in
            self.titleLabel.text = "추천👍"
        }

        actionBtn.addItem(title: "좋아요", image: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)) { item in
            self.titleLabel.text = "좋아요❤️"
        }

        actionBtn.addItem(title: "공유", image: UIImage(systemName: "arrowshape.turn.up.right.fill")?.withRenderingMode(.alwaysTemplate)) { item in
            self.titleLabel.text = "공유📤"
        }
        
        actionBtn.display(inViewController: self)
        
        // 왼쪽 플로팅 액션 버튼
        let secondActionBtn = JJFloatingActionButton()
        
        secondActionBtn.buttonColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)

        secondActionBtn.addItem(title: "", image: nil) { item in
          // do something
            let alertController = UIAlertController(title: "작성", message: "내용을 입력해주세요", preferredStyle: .alert)
            alertController.addTextField()
            let submitBtnAction = UIAlertAction(title: "완료", style: .default, handler: { action in
                let textField = alertController.textFields![0]
                
                guard let userInputText = textField.text else {
                    print("값이 없음")
                    return
                }
                
                self.titleLabel.text = userInputText
            })
            alertController.addAction(submitBtnAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        view.addSubview(secondActionBtn)
        secondActionBtn.translatesAutoresizingMaskIntoConstraints = false
        secondActionBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        secondActionBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }


}

