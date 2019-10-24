//
//  ViewController.swift
//  colorApp
//
//  Created by 吉家哲平 on 2019/08/27.
//  Copyright © 2019 吉家哲平. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var RGBLabel: UILabel!
    
    @IBOutlet weak var redValue: UISlider!
    @IBOutlet weak var greenValue: UISlider!
    @IBOutlet weak var blueValue: UISlider!
    
    @IBOutlet weak var table: UITableView!
    
    var r = 255, g = 255, b = 255
    var value: Int = 0
    
    func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0,
                       green: CGFloat(g) / 255.0,
                       blue: CGFloat(b) / 255.0,
                       alpha: alpha)
    }
    
    func check(value: Int) -> Int {
        if value > 255 {
            self.value = 255
        }
        if value < 0 {
            self.value = 0
        }
        
        return value
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        //indexPath.rowで上から何番目なのかとれる
        
        var red = r, green = g, blue = b
        switch indexPath.row {
        case 1:
            red = check(value: r-20)
        case 2:
            red = check(value: r-10)
        case 3:
            red = check(value: r+10)
        case 4:
            red = check(value: r+20)
        case 5:
            green = check(value: g-20)
        case 6:
            green = check(value: g-10)
        case 7:
            green = check(value: g+10)
        case 8:
            green = check(value: g+20)
        case 9:
            blue = check(value: b-20)
        case 10:
            blue = check(value: b-10)
        case 11:
            blue = check(value: b+10)
        case 12:
            blue = check(value: b+20)
        default:
            break //do nothing
        }
        
        cell.backgroundColor = rgb(r: red, g: green, b: blue, alpha: 1)
        cell.textLabel?.text = String(NSString(format: "%02x%02x%02x", red, green, blue)).uppercased()
        
        return cell
        
    }
    
    func changValue() {
        
        RGBLabel.text = "RGB value is #" + String(NSString(format: "%02x%02x%02x", r, g, b)).uppercased()
        table.reloadData()
        
    }
    @IBAction func redSlide(_ sender: Any) {
        print(redValue!)
        r = Int(redValue.value)
        redLabel.text = "R: \(r)"
        changValue()
    }
    @IBAction func greenSlide(_ sender: Any) {
        print(greenValue!)
        g = Int(greenValue.value)
        greenLabel.text = "G: \(g)"
        changValue()
    }
    @IBAction func blueSlide(_ sender: Any) {
        print(blueValue!)
        b = Int(blueValue.value)
        blueLabel.text = "B: \(b)"
        changValue()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLabel.text = "R: \(0)"
        greenLabel.text = "G: \(0)"
        blueLabel.text = "B: \(0)"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

