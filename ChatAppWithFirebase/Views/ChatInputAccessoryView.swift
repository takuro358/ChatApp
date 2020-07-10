//
//  ChatInputAccessoryView.swift
//  ChatAppWithFirebase
//
//  Created by takuro on 2020/07/09.
//  Copyright © 2020 takuro. All rights reserved.
//

import UIKit

protocol ChatInputAccessoryViewDelegate: class {
    func tappedSendButtom(text: String)
}

class ChatInputAccessoryView: UIView {
    
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendButtom: UIButton!
    
    @IBAction func tappedSendButtom(_ sender: Any) {
        guard let text = chatTextView.text else { return }
        delegate?.tappedSendButtom(text: text)
    }
    
    weak var delegate: ChatInputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibInit()
        setUpViews()
        autoresizingMask = .flexibleHeight
        
    }
    
    private func setUpViews() {
        
        chatTextView.layer.cornerRadius = 15
        chatTextView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        chatTextView.layer.borderWidth = 1
        
        sendButtom.layer.cornerRadius = 15
        sendButtom.imageView?.contentMode = .scaleAspectFill
        sendButtom.contentHorizontalAlignment = .fill
        sendButtom.contentVerticalAlignment = .fill
        sendButtom.isEnabled = false
        
        chatTextView.text = ""
        chatTextView.delegate = self
        
    }
    
    func removeText() {
        
        chatTextView.text = ""
        sendButtom.isEnabled = false
        
    }
    
    override var intrinsicContentSize: CGSize {
        
        return .zero
        
    }
    
    private func nibInit() {
        
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatInputAccessoryView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            sendButtom.isEnabled = false
        } else {
            sendButtom.isEnabled = true
        }
        
    }
    
}
