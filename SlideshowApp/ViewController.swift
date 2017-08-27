//
//  ViewController.swift
//  SlideshowApp
//
//  Created by meg on 2017/08/19.
//  Copyright © 2017年 megusta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageNames = ["p１.JPG", "p２.JPG", "p３.JPG", "p４.JPG", "p５.JPG"]
    
    var imageIndex = 0
    
    var timer: Timer!
    
    
    
    
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    
    @IBOutlet weak var nextbutton: UIButton!
    
    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var backbutton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // シングルタップ
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
        
        // デリゲートをセット
        tapGesture.delegate = self as? UIGestureRecognizerDelegate;
        
        
        // imageviewに追加.
        self.imageview.addGestureRecognizer(tapGesture)
        
    }
    
    // タップイベント.
    func tap(_ sender: UITapGestureRecognizer){
        
        if timer != nil {
            timer.invalidate()   // 現在のタイマーを破棄する
            timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            
            nextbutton.isEnabled = true     //ボタン有効
            backbutton.isEnabled = true     //ボタン有効
        }
        
        imageview.image = UIImage(named: imageNames[imageIndex])
        
        
        //タップ時にFullscreenに遷移させる
        performSegue(withIdentifier: "Fullscreen", sender: nil)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //segueにつなぐ
        if (segue.identifier == "Fullscreen") {
            
            let viewController2:ViewController2 = segue.destination as! ViewController2
            viewController2.imageName = imageNames[imageIndex]
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func nextbutton(_ sender: Any) {
        
        
        imageIndex += 1
        
        //最後の画像で進むボタンを押すと最初の画像になる
        if imageIndex >= imageNames.count {
            imageIndex = 0
        }
        
        
        imageview.image = UIImage(named: imageNames[imageIndex])
    }
    
    
    @IBAction func backbutton(_ sender: Any) {
        
        imageIndex -= 1
        
        //最初の画像で戻るボタンを押すと最後の画像になる
        if imageIndex >= -1 {
            imageIndex = imageNames.count - 1
        }
        
        imageview.image = UIImage(named: imageNames[imageIndex])
    }
    
    
    
    //時間が来た時の動作
    func playpause() {
        
        imageIndex += 1
        
        
        //最後の画像になったら最初に戻る
        if imageIndex >= 5 {
            imageIndex = 0
        }
        
        
        
        imageview.image = UIImage(named: imageNames[imageIndex])
    }
    
    
    @IBAction func playbutton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(playpause), userInfo: nil, repeats: true)
            
            playbutton.setTitle("停止", for: .normal)
            
            
            nextbutton.isEnabled = false    //ボタン無効
            backbutton.isEnabled = false    //ボタン無効
        }
        else {
            timer.invalidate()
            timer = nil
            
            playbutton.setTitle("再生", for: .normal)
            
            nextbutton.isEnabled = true     //ボタン有効
            backbutton.isEnabled = true     //ボタン有効
        }
        
        
        
        imageview.image = UIImage(named: imageNames[imageIndex])
        
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
}
