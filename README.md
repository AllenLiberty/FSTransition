## FSTransition
### 目标：这大概是最简洁的 转场动画 库了

* 最简洁的API 实现任何自定义转场动画
* 清晰的Interface

### 结果演示
![markdown](https://github.com/AllenLiberty/resource/blob/master/2019-07-26%2016-38-50.2019-07-26%2016_42_25.2019-07-26%2017_02_56.gif)!
![markdown](https://github.com/AllenLiberty/resource/blob/master/2019-07-26%2016-43-48.2019-07-26%2016_46_32.2019-07-26%2017_04_13.gif)!

### 使用
#### 1. 创建一个动画实现类 遵循FSTransitionAnimationProtocol协议

```swift
import UIKit
class ScaleTransitionAnimation: FSTransitionAnimationProtocol {

    var snapToView: UIView?
    
    var snapFromView: UIView?
	
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        // 在这里完成你的进场动画  
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        // 在这里完成你的退场动画
    }
}

```
下面我们添加一些简单的缩放动画
```swift
import UIKit

class ScaleTransitionAnimation: FSTransitionAnimationProtocol {
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapFromView.layer.transform = CATransform3DIdentity
        
        UIView.animate(withDuration: 0.6, animations: {
            snapFromView.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        }) { (finish) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapFromView)
        containerView.addSubview(snapToView)
        snapToView.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.6, animations: {
            snapToView.layer.transform = CATransform3DIdentity
        }) { (finish) in
            animationComplete()
        }
    }
}
```

### 2. 外部调用
#### 2.1  非手势转场调用
```swift
 @IBAction func onPushAnimation(_ sender: Any) {
        let animation = ScaleTransitionAnimation()
        let vc = ScaleSecondViewController.init(nibName: "ScaleSecondViewController", bundle: nil)
        self.fs_pushViewController(vc, animation: animation)
    }
```
#### 2.2  手势转场调用
注册手势转场
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerToInteractiveTransition([.left]) {[weak self] in
            let animation = OpenDoorTranstionAnimation()
            let vc = OpenDoorSecondViewController.init(nibName: "OpenDoorSecondViewController", bundle: nil)
            self?.fs_pushViewController(vc, animation: animation)
        }
    }
```
注册手势退场
```swift
class InteractiveViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerBackInteractiveTransition([.right]) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
```
#### 2.3  手势转场设置手势响应区域
想要在中间区域 响应手势的时候 我们需要设置  .leftOffset( CGFloat ) 
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerToInteractiveTransition([.leftOffset(view.frame.width / 2.0), .rightOffset(view.frame.width / 2.0)]) {
            let animation = OpenMiddleTranstionAnimation()
            let vc = OpenMiddleSecondViewController.init(nibName: "OpenMiddleSecondViewController", bundle: nil)
            self.fs_pushViewController(vc, animation: animation)
        }
    }
```
注册左右两边区域为返回的响应区域
```swift
override func viewDidLoad() {
        super.viewDidLoad()
       fs_registerBackInteractiveTransition([.left, .right]) {
            self.navigationController?.popViewController(animated: true)
        }
    }
```








