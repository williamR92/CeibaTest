//
//  ProgressView.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import UIKit

public class IJProgressView {

    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()

    public class var shared: IJProgressView {
        struct Static {
            static let instance: IJProgressView = IJProgressView()
        }
        return Static.instance
    }

    public func showProgressView(view: UIView) {
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.3)

        progressView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        progressView.center = view.center
        progressView.backgroundColor = .clear

        activityIndicator.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        activityIndicator.style = .gray
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2,y :progressView.bounds.height / 2)

        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)

        activityIndicator.startAnimating()
    }

    public func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}

extension UIColor {

    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
