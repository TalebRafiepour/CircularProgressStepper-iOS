# CircularProgressStepper-iOS
Circular Progress Stepper For Showing Progress Of A Process In Multiple Steps.

<img src="https://github.com/TalebRafiepour/CircularProgressStepper-iOS/blob/master/cps-iOS.gif" width="300"> 

## Installation
###  CocoaPods
To integrate CircularProgressStepper into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
platform :ios, '9.0'
use_frameworks!

target 'YourProjectName' do
  pod 'CircularProgressStepper'
end
```
And then remember to `import CircularProgressStepper` module before using it.

###  Manually
You could directly copy and add the folder `CircularProgressStepper` which contains 'CircularProgressStepperView.swift' file to your project.   


## Usage
You could use `CircularProgressStepperView` like you use `UIView`, create and layout it programmatically, or get everything done with Storyboard and XIB. Additionally, clone this [Demo](https://github.com/TalebRafiepour/CircularProgressStepper-iOS) project to find out how easy it is working. It also provides a way to cooperate with UIScrollView.
### Programmatically
```swift
    //......
    let circularProgressStepperView = CircularProgressStepperView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.circularProgressStepperView.frame = CGRect(x: 0, y: 50, width: 280, height: 100)
        self.view.addSubview(self.circularProgressStepperView)
        
        self.circularProgressStepperView.numOfSteps = 5
        self.circularProgressStepperView.currnetStep = 0
    }
    //......
```

### Customization (Optional)
Values of following properties have been set as defaults already. Change them if they are not suitable for you.
```swift
    self.circularProgressStepperView.backgroundColor = UIColor(red: 179.0/255.0, green: 189.0/255.0, blue: 194.0/255.0, alpha: 1.0)
    self.circularProgressStepperView.foregroundColor = UIColor(red: 0.0/255.0, green: 180.0/255.0, blue: 124.0/255.0, alpha: 1.0)
    self.circularProgressStepperView.progressStrokeOffset = 3.0
    self.circularProgressStepperView.padding = 10.0
    self.circularProgressStepperView.stepSize = 24.0
    self.circularProgressStepperView.numOfSteps = 5
    
    ////////////Or If You Want to Add CustomImage For Each Step
  private let stepperImage = [UIImage(named: "ic_one")!,UIImage(named: "ic_two")!,UIImage(named: "ic_three")!,UIImage(named: "ic_four")!,UIImage(named: "ic_five")!]
    self.circularProgressStepperView.stepsImage = stepperImage
```

