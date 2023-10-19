import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        let vc = HomeViewController()
        _view.addSubview(vc.view)
        
//        _view.backgroundColor = UIColor.white
//        let nativeLabel = UILabel()
//        nativeLabel.text = "Native text from iOS"
//        nativeLabel.textColor = UIColor.blue
//        nativeLabel.textAlignment = .center
//        nativeLabel.frame = CGRect(x: 130, y: 200, width: 180, height: 48.0)
//        _view.addSubview(nativeLabel)
//        
//        let button = UIButton(type: .custom)
//        button.backgroundColor = UIColor.red
//        button.frame = CGRect(x: 130, y: 250, width: 100, height: 50)
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
//        _view.addSubview(button)
    }
    
    @objc func buttonClick() {
        print("buttonClickbuttonClick")
        let vc = HomeViewController()
        _view.addSubview(vc.view)
        
    }
}
