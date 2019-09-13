//
//  ViewController.swift
//  examples-demo
//
//  Created by Taleb on 9/9/19.
//  Copyright © 2019 Taleb. All rights reserved.
//

import UIKit
import FlexColorPicker
import CircularProgressStepper

class ViewController: UIViewController {

    @IBOutlet weak var cpsPaddingLabel: UILabel!
    @IBOutlet weak var progressStepSizeLabel: UILabel!
    @IBOutlet weak var progressStrokeOffsetLabel: UILabel!
    @IBOutlet weak var numberOfStepsLabel: UILabel!
    @IBOutlet weak var currentStepLabel: UILabel!
    @IBOutlet weak var currnetStepSteper:UIStepper!
    @IBOutlet weak var cpsForegroundColor: UIView!
    @IBOutlet weak var cpsProgressColor: UIView!
    @IBOutlet weak var cpsForegroundColorLabel:UILabel!
    @IBOutlet weak var cpsProgressColorLabel:UILabel!
    @IBOutlet weak var circularStepperView: CircularProgressStepperView!
    private let stepperImage = [UIImage(named: "ic_one")!,UIImage(named: "ic_two")!,UIImage(named: "ic_three")!,UIImage(named: "ic_four")!,UIImage(named: "ic_five")!]
    
    private var foregroundColorPicker:DefaultColorPickerViewController!
    private var progressColorPicker:DefaultColorPickerViewController!
    private var isForegroundColor = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cpsForegroundColor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(foregroundColorSelected)))
        foregroundColorPicker = DefaultColorPickerViewController()
        foregroundColorPicker.delegate = self
        
        cpsProgressColor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(progressColorSelected)))
        progressColorPicker = DefaultColorPickerViewController()
        progressColorPicker.delegate = self
        
    }
    
    @objc private func foregroundColorSelected() {
        self.navigationController?.pushViewController(foregroundColorPicker, animated: true)
        isForegroundColor = true
    }
    
    @objc private func progressColorSelected() {
        self.navigationController?.pushViewController(progressColorPicker, animated: true)
        isForegroundColor = false
    }

    @IBAction func stepperWithCustomImage(_ sender: UISwitch) {
        if sender.isOn {
            circularStepperView.stepsImage = stepperImage
        }else {
            circularStepperView.stepsImage = []
        }
    }
    @IBAction func numOfStepsChanged(_ sender: UIStepper) {
        circularStepperView.numOfSteps = Int(sender.value.rounded())
        numberOfStepsLabel.text = "\(Int(sender.value.rounded()))"
        currnetStepSteper.maximumValue = sender.value.rounded()
    }
    
    @IBAction func currentStepChanged(_ sender: UIStepper) {
        circularStepperView.currnetStep = CGFloat(sender.value.rounded())
        currentStepLabel.text = "\(Int(sender.value.rounded()))"
    }
    
    @IBAction func cpsStrokeOffsetChanged(_ sender: UISlider) {
        circularStepperView.progressStrokeOffset = CGFloat(sender.value)
        progressStrokeOffsetLabel.text = "\(sender.value.rounded()) dp"
    }
    
    @IBAction func progressStepSizeChanged(_ sender: UISlider) {
        circularStepperView.stepSize = CGFloat(sender.value)
        progressStepSizeLabel.text = "\(sender.value.rounded()) dp"
    }
    
    @IBAction func cpsPaddingChanged(_ sender: UISlider) {
        circularStepperView.padding = CGFloat(sender.value)
        cpsPaddingLabel.text = "\(sender.value.rounded()) dp"
    }
}


extension ViewController : ColorPickerDelegate {
    
    func colorPicker(_ colorPicker: ColorPickerController, selectedColor: UIColor, usingControl: ColorControl) {
        if isForegroundColor {
            cpsForegroundColor.backgroundColor = selectedColor
            circularStepperView.foregroundColor = selectedColor
            cpsForegroundColorLabel.text = "#\(selectedColor.hexValue())"
        }else {
            cpsProgressColor.backgroundColor = selectedColor
            circularStepperView.progressColor = selectedColor
            cpsProgressColorLabel.text = "#\(selectedColor.hexValue())"
        }
    }
    
    func colorPicker(_ colorPicker: ColorPickerController, confirmedColor: UIColor, usingControl: ColorControl) {
        
    }
    
    
}

