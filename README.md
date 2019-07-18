### 目标

* 最简洁的API 实现任何自定义转场动画
* 清晰的Interface

### 结果演示
![markdown](https://github.com/AllenLiberty/FSTransition/blob/master/GIF/2019-07-18%2010-25-14.2019-07-18%2010_25_48.gif)!

### 使用
#### 1. 创建一个动画实现类 遵循FSTransitionAnimationProtocol协议

```swift
import UIKit
class ScaleTransitionAnimation: FSTransitionAnimationProtocol {
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        
    }
}

```
下面我们添加一些简单的缩放动画
```swift
import UIKit

class ScaleTransitionAnimation: FSTransitionAnimationProtocol {
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.6, animations: {
            toView.transform = CGAffineTransform.identity
        }) { (finish) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        containerView.addSubview(toView)
        containerView.addSubview(fromView)
        UIView.animate(withDuration: 0.6, animations: {
            fromView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        }) { (finish) in
            animationComplete()
        }
    }
}
```

#### 2. 外部调用
##### 2.1  非手势转场调用
```swift
 @IBAction func onPushAnimation(_ sender: Any) {
        let animation = ScaleTransitionAnimation()
        let vc = TestViewController.init(nibName: "TestViewController", bundle: nil)
        self.fs_pushViewController(vc, animation: animation)
    }
```
##### 2.2  手势转场调用
注册手势转场
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        self.fs_registerToInteractiveTransition(.right) {[weak self] in
            let animation = SliderTransitionAnimation()
            let vc = InteractiveViewController.init(nibName: "InteractiveViewController", bundle: nil)
            self?.fs_presentViewController(vc, animation: animation)
        }
    }
```
注册手势退场
```swift
class InteractiveViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerBackInteractiveTransition(UIRectEdge.left) {[weak self] in
            self?.dismiss(animated: true, completion: nil)
            }
    }
}
```







