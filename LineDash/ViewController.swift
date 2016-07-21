//
//  ViewController.swift
//  LineDash
//
//  Created by WillowRivers on 16/6/24.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate{

    var slider : UISlider? ;
    var pickV : UIPickerView? ;
    var showArea : LinDash? ;
    
    let sourceArr : Array<Array<CGFloat>> = [[10.0 , 10],[5 , 9.0 , 10 , 12],[9 , 5.0 , 13],[13 , 11.0 , 8 , 6]] ;
    
    override func viewDidLoad() {
        super.viewDidLoad() ;
        let vHeight = view.frame.height ;
        let vWeight = view.frame.width ;
        
        showArea = LinDash()
        showArea?.frame = CGRectMake(10 , 10 , vWeight - 20 , vHeight * 2/5 ) ;
        
        pickV = UIPickerView(frame: CGRectMake(vWeight / 10 , vHeight * 3/5, vWeight * 4/5 , vHeight * 2/5)) ;
        pickV?.dataSource = self ;
        pickV?.delegate = self ;
        
        slider = UISlider(frame: CGRectMake(vWeight / 10 , vHeight / 2 , vWeight * 4/5 , vHeight / 20) ) ;
        slider?.value = 0.5 ;
        slider?.addTarget(self, action: "setPase", forControlEvents: .ValueChanged) ;
        
        showArea?.pase = CGFloat((slider?.value)! * Float(10.0)) ;
        
        
        
        print("mainScreen height is :\(UIScreen.mainScreen().bounds.height)") ;
        print("frame weight is :\(view.frame.width)") ;
        
        if self.respondsToSelector("prefersStatusBarHidden")  //hidden status bar
        {
            self.prefersStatusBarHidden() ;
            self.performSelector("setNeedsStatusBarAppearanceUpdate") ;
        }
        
        view.addSubview(showArea!) ;
        view.addSubview(slider!) ;
        view.addSubview(pickV!) ;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {}
    
    override func prefersStatusBarHidden() -> Bool           //hidden status bar
    {
        return  true ;
    }
    
    func setPase()
    {
        showArea?.pase = CGFloat((slider?.value)! * Float(10.0)) ;
        print("pase is :\(showArea?.pase)") ;
        showArea?.setNeedsDisplay() ;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1 ;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return sourceArr.count ;
    }
    
   func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return String(sourceArr[row]) ;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
     {
        showArea?.length = sourceArr[row] ;
        print("length is :\(String(sourceArr[row]))") ;
        showArea?.setNeedsDisplay() ;
    }
    
}

