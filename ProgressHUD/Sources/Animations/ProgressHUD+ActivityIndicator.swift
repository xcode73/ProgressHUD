//
// Copyright (c) 2024 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

class ActivityIndicatorOldStyle: UIImageView {
    
    var hidesWhenStopped : Bool = true

    override func startAnimating() {
        isHidden = false
        rotate()
    }

    override func stopAnimating() {
        if hidesWhenStopped {
            isHidden = true
            removeRotation()
        }
    }

    private func rotate() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        layer.add(rotation, forKey: "rotationAnimation")
    }

    private func removeRotation() {
        layer.removeAnimation(forKey: "rotationAnimation")
    }
}

// MARK: - Activity Indicator
extension ProgressHUD {

    func animationActivityIndicator(_ view: UIView) {
        
        let spinner = ActivityIndicatorOldStyle(image: UIImage(named: "ic.loader"))
        let scale = view.frame.size.width / spinner.frame.size.width
        spinner.transform = CGAffineTransform(scaleX: scale, y: scale)
        spinner.frame = view.bounds
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        view.addSubview(spinner)
    }
}
