//
//  CircularProgressStepperView.swift
//  CircularProgressStepper
//
//  Created by Taleb on 9/9/19.
//  Copyright © 2019 Taleb. All rights reserved.
//

import Foundation

@IBDesignable
open class CircularProgressStepperView: UIView {
    
    private let backgroundLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private var stepLayers = [CAShapeLayer]()
    private var stepImageViews = [UIImageView]()
    private let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    @IBInspectable
    open var stepSize:CGFloat = 28.0 {
        didSet{setNeedsDisplay()}
    }
    
    @IBInspectable
    open var numOfSteps:Int = 5 {
        didSet {
            if currnetStep > CGFloat(numOfSteps) {
                currnetStep = CGFloat(numOfSteps)
            }else {
                let stepDegree = 360.0/CGFloat(numOfSteps)
                self.currentProgress = stepDegree*currnetStep
                drawSteps()
            }
        }
    }
    
    @IBInspectable
    open var currnetStep:CGFloat = 1.0 {
        didSet {
            if currnetStep > CGFloat(numOfSteps) || currnetStep < 0 {
                return
            }else {
                let stepDegree = 360.0/CGFloat(numOfSteps)
                print("currentStep: \(currnetStep)\t currntProgressDegree \(stepDegree*currnetStep)")
                self.currentProgress = stepDegree*currnetStep
                drawSteps()
            }
        }
    }
    
    @IBInspectable
    open var padding:CGFloat = 5.0 {
        didSet{setNeedsDisplay()}
    }
    
    private var currentProgress:CGFloat = 250.0 {
        didSet  {
            setCurrentProgress(value: currentProgress/360.0)
        }
    }
    
    @IBInspectable
    open var foregroundColor:UIColor = UIColor.init(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1) {
        didSet {setNeedsDisplay()}
    }
    
    @IBInspectable
    open var progressColor:UIColor = UIColor.init(red: 0.0, green: 250.0/255.0, blue: 146.0/255.0, alpha: 1) {
        didSet {setNeedsDisplay()}
    }
    
    @IBInspectable
    open var progressStrokeOffset:CGFloat = 5.0 {
        didSet{drawProgressLayer()}
    }
    
    open var stepsImage:[UIImage] = [] {
        didSet {
            if numOfSteps < stepsImage.count {numOfSteps = stepsImage.count}
            drawSteps()
        }
    }
    
    
    open override func draw(_ rect: CGRect) {
        initCPS()
    }

    
    
    private func initCPS(){
        //draw background layer
        drawBackgroundLayer()
        
        //draw progress layer
        drawProgressLayer()
        
        //draw steps
        drawSteps()
    }
    
    private func drawBackgroundLayer() {
        let circleRadius = (min(bounds.width, bounds.height) / 2.0) - (stepSize / 2.0 ) - padding
        //let circleWidth = min(rect.width, rect.height) - 2 * padding
        let strokeWidth = stepSize / 4.0
        let circleStrokeWidth = strokeWidth == 0 ? 2: strokeWidth
        
        //draw background layer
        let backgroundPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width/2, y: bounds.height/2), radius: circleRadius, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = foregroundColor.cgColor
        backgroundLayer.lineWidth = circleStrokeWidth
        backgroundLayer.lineCap = .round
        backgroundLayer.path = backgroundPath.cgPath
        if backgroundLayer.superlayer == nil {
            layer.insertSublayer(backgroundLayer, below: progressLayer)
        }
    }
    
    private func drawProgressLayer() {
        let circleRadius = (min(bounds.width, bounds.height) / 2.0) - (stepSize / 2.0 ) - padding
        let circleStrokeWidth = stepSize / 4.0
        let progressStrokeWidth = circleStrokeWidth - progressStrokeOffset
        
        let progressPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width/2, y: bounds.height/2), radius: circleRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = progressStrokeWidth
        progressLayer.lineCap = .round
        progressLayer.path = progressPath.cgPath
        let strokeEnd = currentProgress/360.0
        if progressLayer.strokeEnd != strokeEnd {
            setCurrentProgress(value: strokeEnd)
        }
        
        if progressLayer.superlayer == nil {
            layer.insertSublayer(progressLayer, above: backgroundLayer)
        }
    }
    
    private func setCurrentProgress(value: CGFloat){
        progressAnimation.fromValue = progressAnimation.toValue
        progressAnimation.toValue = value
        progressAnimation.duration = 0.5
        progressAnimation.fillMode = .both
        progressAnimation.isRemovedOnCompletion = false
        self.progressLayer.removeAnimation(forKey: "progressAnimation")
        self.progressLayer.add(progressAnimation, forKey: "progressAnimation")
    }
    
    private func drawSteps() {
        let circleRadius = (min(bounds.width, bounds.height) / 2.0) - (stepSize / 2.0 ) - padding
        
        let stepDegree = 360.0 / CGFloat(numOfSteps)
        if numOfSteps < 1 {return}
        clearSteps()
        for i in 0...numOfSteps-1 {
            let currentDegree = stepDegree * CGFloat(i)
            let currentRadian = (currentDegree * CGFloat.pi) / 180.0
            let centerX = (bounds.width / 2.0) - (stepSize / 2.0)
            let centerY = (bounds.height / 2.0) - (stepSize / 2.0)
            
            let stepX = circleRadius * cos(currentRadian) + centerX
            let stepY = circleRadius * sin(currentRadian) + centerY
            
            let stepBound = CGRect(x: stepX, y: stepY, width: stepSize, height: stepSize)
            let stepPath = UIBezierPath(ovalIn: stepBound)
            let stepLayer = CAShapeLayer()
            var imageColor = progressColor
            if currentDegree <= currentProgress {
                stepLayer.fillColor = progressColor.cgColor
                imageColor = foregroundColor
            }else {
                stepLayer.fillColor = foregroundColor.cgColor
                imageColor = progressColor
            }
            stepLayer.path = stepPath.cgPath
            self.layer.addSublayer(stepLayer)
            stepLayers.append(stepLayer)
            
            if stepsImage.count > i {
                let imageView = UIImageView(image: stepsImage[i].withRenderingMode(.alwaysTemplate))
                let imagePaddingOffset = stepSize*0.1
                imageView.frame = stepBound.inset(by: UIEdgeInsets(top: imagePaddingOffset, left: imagePaddingOffset, bottom: imagePaddingOffset, right: imagePaddingOffset))
                imageView.tintColor = imageColor
                addSubview(imageView)
                stepImageViews.append(imageView)
            }
        }
    }
    
    private func clearSteps() {
        for stepIV in stepImageViews {
            stepIV.removeFromSuperview()
        }
        
        for step in stepLayers {
            step.removeFromSuperlayer()
        }
        
        stepImageViews.removeAll()
        stepLayers.removeAll()
    }
    
    
    open func goToNextStep() {
        if currnetStep+1.0 < CGFloat(numOfSteps) {
            self.currnetStep += 1
        }
    }
    
    open func goToPrevStep() {
        if currnetStep > 0 {
            currnetStep -= 1
        }
    }
    
}


extension CircularProgressStepperView {
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initCPS()
    }
}
