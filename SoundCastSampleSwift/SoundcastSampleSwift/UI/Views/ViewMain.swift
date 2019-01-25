import UIKit
import AVFoundation
import AVKit
import SoundCastIosSdk

class ViewMain: BaseView, UITableViewDelegate, UITableViewDataSource, SoundCastDelegate, SoundCastDataSource {
    
    let CallAd = "call ad"
    let StartAd = "ad start"
    let ErrorAd = "Error: No ad"
    let FirstQuartile = "ad first quartile"
    let MidPoint = "ad midpoint"
    let ThirdQuartile = "ad third quartile"
    let Complete = "ad complete"
    let PlayContent = "audio content play"

    @IBOutlet weak var _imgCheckTestMode: UIImageView!
    @IBOutlet weak var _imgCheckRoll: UIImageView!
    @IBOutlet weak var _lblCurrentTime: UILabel!
    @IBOutlet weak var _sliderPlay: UISlider!
    @IBOutlet weak var _lblTotalTime: UILabel!
    @IBOutlet weak var _tbvEvents: UITableView!
    @IBOutlet weak var _tfNetworkID: UITextField!
    @IBOutlet weak var _tfSiteID: UITextField!
    @IBOutlet weak var _tfTagID: UITextField!
    @IBOutlet weak var _btnPlay: UIButton!
    @IBOutlet weak var _btnStop: UIButton!
    @IBOutlet weak var _btnSkipAD: UIButton!

    var soundCastController: SoundCastController?
    var avPlayerItem = AVPlayerItem.init(url: URL(string: "https://demo-stg.soundcast.fm/assets/audio/going-blind-court_1.mp3")!)
    var avPlayer = AVPlayer()
    var timer: Timer?
    var isTestModeChecked = false
    var isRollChecked = false
    var isPlayed = false
    var isMainMedia : Bool?
    var listData: [String]?
    let listColor = ["call": #colorLiteral(red: 0.767790234, green: 0.9747441541, blue: 0.9868099304, alpha: 1), "complete": #colorLiteral(red: 0.7091954836, green: 0.9788523707, blue: 0.721101007, alpha: 1), "playVideo": #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), "error": #colorLiteral(red: 0.9868099304, green: 0.7479215957, blue: 0.7550354997, alpha: 1)]

    let imagePlay = "play.png"
    let imagePause = "pause.png"
    let imageUncheck = "uncheck.png"
    let imageCheck = "checked.png"

    override func setupView() {
        self.timer?.invalidate()
        _btnSkipAD.isHidden = true
        initSoundCastSDK()
        initTableView()
    }

    func setImageButton(_ sender: UIButton,_ image: String) {
        sender.setImage(UIImage.init(named: image), for: .normal)
    }

    func updateValueSlider(_ value: Float) {
        self._lblCurrentTime.text = String(Int(value))
        self._sliderPlay.setValue(value, animated: false)
    }

    func initSlider(_ total: Float, _ current: Float?) {
        self._lblTotalTime.text = String(Int32(total))
        if current == nil {
            self._lblCurrentTime.text = "0"
        } else {
            self._lblCurrentTime.text = String(Int32(current!))
        }
        self._sliderPlay.minimumValue = 0
        self._sliderPlay.maximumValue = total

    }

    func initSoundCastSDK() {
        soundCastController = SoundCastController()
        soundCastController?.delegate = self
        soundCastController?.dataSource = self
    }

    func initTableView() {
        _tbvEvents.delegate = self
        _tbvEvents.dataSource = self
        _tbvEvents.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.listData = []
    }

    func initViewMedia() {
        self.initSlider()
        _btnSkipAD.isHidden = true
        self.isMainMedia = nil
        listData?.removeAll()
    }

    func initSlider() {
        self.timer?.invalidate()
        _sliderPlay.value = 0
        _sliderPlay.minimumValue = 0
        _sliderPlay.maximumValue = 0
        _lblTotalTime.text = "-"
        _lblCurrentTime.text = "-"
    }

    func addValueList(value: String) {
        if !isExist(list: listData, item: value) {
            self.listData?.append(value)
            _tbvEvents.reloadData()
        }
    }

    func isExist(list: [String]?, item: String) -> Bool {
        if list != nil {
            for i in list! where i == item {
                return true
            }
        }
        return false
    }
    @IBAction func _btnCheckRoll(_ sender: Any) {
        if isRollChecked {
            _imgCheckRoll.image = UIImage.init(named: imageUncheck)
            isRollChecked = false
        } else {
            _imgCheckRoll.image = UIImage.init(named: imageCheck)
            isRollChecked = true
        }
    }

    @IBAction func btnCheckTestMode(_ sender: Any) {
        if isTestModeChecked {
            _imgCheckTestMode.image = UIImage.init(named: imageUncheck)
            isTestModeChecked = false
        } else {
            _imgCheckTestMode.image = UIImage.init(named: imageCheck)
            isTestModeChecked = true
        }
    }

    @IBAction func btnSkipAD(_ sender: Any) {
        print("skip ---------------")
        self.soundCastController?.stopMedia()
        self.timer?.invalidate()
        self.didPlayToEndAd()
    }

    @IBAction func changeValueSlider(_ sender: UISlider) {
        if self.isMainMedia != nil && self.isMainMedia! {
            let duration: CMTime = (avPlayer.currentItem?.asset.duration)!
            let secondsTotal: Float64 = CMTimeGetSeconds(duration)
            let timeTotal: Int32 = Int32(secondsTotal)
            avPlayer.seek(to: CMTimeMakeWithSeconds(Float64(sender.value), preferredTimescale: timeTotal))
        }
    }

    @IBAction func btnPlay(_ sender: Any) {
        
        if isMainMedia == nil {
            soundCastController?.enableTestMode(isTestModeChecked)
            if isRollChecked {
                self.soundCastController?.setAdsZone(Constants.mid_roll, 10)
            } else {
                self.soundCastController?.setAdsZone(Constants.pre_roll, 0)
            }
            self.initViewMedia()
            self.addValueList(value: CallAd)
            self.soundCastController?.loadAd(Int(_tfNetworkID.text ?? "1")!, Int(_tfSiteID.text ?? "1")!, Int(_tfTagID.text ?? "1")!, nil, nil, nil, nil, nil)
        } else if isMainMedia! {
            if isPlayed {
                pause()
            } else {
                play()
            }
        } else {
            // Pause
            print("click play ad------------------")
            if self.soundCastController?.isPlayAd() != nil && self.soundCastController!.isPlayAd() {
                self.soundCastController?.skipAd()
            }
        }
    }

    @IBAction func _btnStop(_ sender: Any) {
        stop()
    }

    func play() {
        print("play")
        self.setImageButton(_btnPlay, imagePause)
        self.avPlayer.play()
        self.isPlayed = true
        self.setupTimer()
        self.timer?.fire()
    }

    func pause() {
        print("pause")
        self.setImageButton(_btnPlay, imagePlay)
        self.isPlayed = false
        self.avPlayer.pause()
        self.timer?.invalidate()
    }

    func stop() {
        if (self.isMainMedia == nil || (self.isMainMedia != nil && self.isMainMedia!) ) {
            self.setImageButton(_btnPlay, imagePlay)
            initViewMedia()
            self.endPlayItem()
            timer?.invalidate()
            _tbvEvents.reloadData()
        } else {
            self.soundCastController?.skipAd()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        var bg_color: UIColor
        switch listData![indexPath.row] {
        case ErrorAd:
            bg_color = listColor["error"]!
        case Complete:
            bg_color = listColor["complete"]!
        case PlayContent:
            bg_color = listColor["playVideo"]!
        default:
            bg_color = listColor["call"]!
        }
        cell.setContent(content: listData![indexPath.row], bg_color: bg_color)
        return cell
    }

    func getResponseAds(request: String) {
        //Not action, call in controller
    }

    func onError(error: String) {
        self.rootVC?.showDialog("Error", error)
    }
    
    func onErrorTracking(error: String) {
        // response tracking error
        print("error on client=======\n\(error)\n============")
    }

    func onErrorLoadMedia(error: String) {
        print("error play ---------------")
//        self.playAdMedia()
    }

    func didFinishWithAd() {
        DispatchQueue.main.async {
            if self.soundCastController?.getAdsZone() == Constants.mid_roll {
                print("mid-------------------")
                self.playSound()
            } else {
                print("pre-------------------")
                self.playAdMedia()
            }
        }
    }

    func didFinishNotAd() {
        DispatchQueue.main.async {
            self.addValueList(value: self.ErrorAd)
            self.playSound()
        }
    }

    func didFinishTrackEvent(response: [String: Any]) {
        // response tracking success
        print("success on client")
    }

    func showButtonSkip() {
        self._btnSkipAD.isHidden = false
    }

    func playing() {
        self.updateValueSlider((self.soundCastController?.getTimeCurrent())!)
    }

    func didPlayToEndAd() {
        print("end ad-----------")
        self.setImageButton(_btnPlay, imagePlay)
        self.addValueList(value: Complete)
        self._btnSkipAD.isHidden = true
        self.initSlider()
        self.isMainMedia = true
        self.playSound()
    }

    func didStart() {
        print("ad start -------")
        self.setImageButton(_btnPlay, imagePause)
        self.initSlider((self.soundCastController?.getTimeTotal())!, nil)
        self.addValueList(value: StartAd)
    }

    func didSkip() {

    }

    func didPause() {

    }

    func didResume() {

    }

    func didFirstQuartile() {
        print("first --------")
        self.addValueList(value: FirstQuartile)
        self.updateValueSlider((self.soundCastController?.getTimeCurrent())!)
    }

    func didMidPoint() {
        print("mid ---------")
        self.addValueList(value: MidPoint)
        self.updateValueSlider((self.soundCastController?.getTimeCurrent())!)
    }

    func didThirdQuartile() {
        print("third ------------")
        addValueList(value: ThirdQuartile)
        self.updateValueSlider((self.soundCastController?.getTimeCurrent())!)
    }
    
    func didImpression() {
        
    }
    
    func didClick() {
        
    }
    
    func didCreativeView() {
        
    }
    
    func didRewind() {
        
    }
    
    func didError() {
        
    }
    
    func didClickTracking() {
        
    }
    
    func didClickThrough() {
        
    }
    
    func didCompanionCreativeView() {
        
    }
    
    func didCompanionClickTracking() {
        
    }
    
    func didCompanionClickThrough() {
        
    }

    func playSound() {
        do {
            if #available(iOS 10.0, *) {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: .default)
            } else {
                // Fallback on earlier versions
            }
            try AVAudioSession.sharedInstance().setActive(true)
            self.addValueList(value: PlayContent)
            self.avPlayer.replaceCurrentItem(with: self.avPlayerItem)
            if #available(iOS 10.0, *) {
                self.avPlayer.automaticallyWaitsToMinimizeStalling = false
            } else {
                // Fallback on earlier versions
            }
            self.isPlayed = true
            self.isMainMedia = true
            self.setupTimer()
            self.avPlayer.play()
        } catch {
            self.rootVC?.showDialog("Error", "Can't play media")
        }
    }

    func setupTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didPlayToEnd),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.avPlayer.currentItem)
    }

    func endPlayItem() {
        avPlayer.seek(to: CMTime.zero)
        avPlayer.replaceCurrentItem(with: nil)
    }

    @objc func didPlayToEnd() {
        print("Finish")
        self.timer?.invalidate()
        self.endPlayItem()
        self.avPlayer.replaceCurrentItem(with: nil)
        self.setImageButton(_btnPlay, imagePlay)
        self.initViewMedia()
        self._tbvEvents.reloadData()
        
    }

    func playAdMedia() {
        if self.avPlayer.currentItem != nil {
            self.pause()
            initViewMedia()
        }
        self.isMainMedia = false
        self.setImageButton(_btnPlay, imagePause)
        self.soundCastController?.playAd()
    }

    @objc public func tick() {
        if self.avPlayer.currentItem != nil {
            let timeCurrent = Int32(CMTimeGetSeconds(self.avPlayer.currentTime()))
            let timeTotal = Int32(CMTimeGetSeconds((self.avPlayer.currentItem?.asset.duration)!))
            print("timer---------\(timeCurrent)--------\(self.avPlayer.rate)------\(timeTotal)")
            self.updateValueSlider(Float(timeCurrent))
            self.initSlider(Float(timeTotal), Float(timeCurrent))
            self.setImageButton(_btnPlay, imagePause)
//            if self.avPlayer.rate == 0 && timeTotal != 0 && timeCurrent != 0 && self.isPlayed {
//                self.avPlayer.play()
//            }
            switch timeCurrent {
            case 10 where self.soundCastController?.getAdsZone() == Constants.mid_roll && self.soundCastController?.getResponseModel()?.getMode() == Constants.test:
                self.pause()
                self.playAdMedia()
            default:
                break
            }
        } else {
            print("---------- error")
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
