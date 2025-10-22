//
//  LoginsVC.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/20/25.
//

import UIKit
import AVFoundation

class LoginsVC: UIViewController {

    @IBOutlet weak var viewVideo: UIView!
    
    @IBOutlet weak var btnHideUnhide: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmailAddress: UITextField!
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var playerObserver: NSObjectProtocol?
    private var email:String = ""
    private var password:String = ""
    var token: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = viewVideo.bounds
    }
    

    //MARK: - Helper Functions
    private func setupUI(){
        setupVideoPlayer()
        tfPassword.setLeftPaddingPoints(10)
        tfEmailAddress.setLeftPaddingPoints(10)
    }
    
    private func setupVideoPlayer() {
        guard let path = Bundle.main.path(forResource: "Clip", ofType:"mp4") else {
            debugPrint("Video file not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = viewVideo.bounds
        playerLayer.videoGravity = .resizeAspectFill
        viewVideo.layer.addSublayer(playerLayer)
        
        self.player = player
        self.playerLayer = playerLayer
        
        player.volume = 0
        player.play()
        
        playerObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: nil,
            queue: .main) { [weak self] _ in
                self?.player?.seek(to: .zero)
                self?.player?.play()
        }
    }
    
    private func CheckFields() -> Bool {
        self.email = (tfEmailAddress.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        self.password = (tfPassword.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if email.isEmpty {
            self.alertMessage(title: K.HOLD_ON, alertMessage: Alerts.EMPTY_EMAIL_ADDRESS, action: nil)
            return false
        } else if !(AppUtility.isValidEmailStrict(email)) {
            self.alertMessage(title: K.HOLD_ON, alertMessage: Alerts.VALID_EMAIL, action: nil)
            return false
        }else if password.isEmpty {
            self.alertMessage(title: K.HOLD_ON, alertMessage: Alerts.EMPTY_OLD_PASSWORD, action: nil)
            return false
        } else if password.count < 8 {
            self.alertMessage(title: K.HOLD_ON, alertMessage: Alerts.PASSWORD_LENGTH_VALIDATION, action: nil)
            return false
        }
        return true
    }
    
    //MARK: - IBActions
    
    @IBAction func loginButtonWasPressed(_ sender: Any) {
        if CheckFields(){
            ModeSelection.instance.homeMode()
        }
    }
    @IBAction func hideUnhideButtonWasPressed(_ sender: Any) {
        if btnHideUnhide.tag == 0 {
            btnHideUnhide.tag = 1
            btnHideUnhide.setImage(UIImage(named: "ic_unhide"), for: .normal)
            tfPassword.isSecureTextEntry = false
        } else {
            btnHideUnhide.tag = 0
            btnHideUnhide.setImage(UIImage(named: "ic_hide"), for: .normal)
            tfPassword.isSecureTextEntry = true
        }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
