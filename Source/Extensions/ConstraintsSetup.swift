import UIKit

// MARK: - BottomContainer autolayout

extension BottomContainerView {

  func setupConstraints() {

    for attribute: NSLayoutAttribute in [.centerX, .centerY] {
      addConstraint(NSLayoutConstraint(item: pickerButton, attribute: attribute,
        relatedBy: .equal, toItem: self, attribute: attribute,
        multiplier: 1, constant: 0))

      addConstraint(NSLayoutConstraint(item: borderPickerButton, attribute: attribute,
        relatedBy: .equal, toItem: self, attribute: attribute,
        multiplier: 1, constant: 0))
    }

    for attribute: NSLayoutAttribute in [.width, .left, .top] {
      addConstraint(NSLayoutConstraint(item: topSeparator, attribute: attribute,
        relatedBy: .equal, toItem: self, attribute: attribute,
        multiplier: 1, constant: 0))
    }

    for attribute: NSLayoutAttribute in [.width, .height] {
      addConstraint(NSLayoutConstraint(item: pickerButton, attribute: attribute,
        relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
        multiplier: 1, constant: ButtonPicker.Dimensions.buttonSize))

      addConstraint(NSLayoutConstraint(item: borderPickerButton, attribute: attribute,
        relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
        multiplier: 1, constant: ButtonPicker.Dimensions.buttonBorderSize))

      addConstraint(NSLayoutConstraint(item: stackView, attribute: attribute,
        relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
        multiplier: 1, constant: ImageStackView.Dimensions.imageSize))
    }

    addConstraint(NSLayoutConstraint(item: doneButton, attribute: .centerY,
      relatedBy: .equal, toItem: self, attribute: .centerY,
      multiplier: 1, constant: 0))

    addConstraint(NSLayoutConstraint(item: stackView, attribute: .centerY,
      relatedBy: .equal, toItem: self, attribute: .centerY,
      multiplier: 1, constant: -2))

    addConstraint(NSLayoutConstraint(item: doneButton, attribute: .centerX,
      relatedBy: .equal, toItem: self, attribute: .right,
      multiplier: 1, constant: -(UIScreen.main().bounds.width - (ButtonPicker.Dimensions.buttonBorderSize + UIScreen.main().bounds.width)/2)/2))

    addConstraint(NSLayoutConstraint(item: stackView, attribute: .centerX,
      relatedBy: .equal, toItem: self, attribute: .left,
      multiplier: 1, constant: UIScreen.main().bounds.width/4 - ButtonPicker.Dimensions.buttonBorderSize/3))

    addConstraint(NSLayoutConstraint(item: topSeparator, attribute: .height,
      relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
      multiplier: 1, constant: 1))
  }
}

// MARK: - TopView autolayout

extension TopView {

  func setupConstraints() {
    addConstraint(NSLayoutConstraint(item: flashButton, attribute: .left,
      relatedBy: .equal, toItem: self, attribute: .left,
      multiplier: 1, constant: Dimensions.leftOffset))

    addConstraint(NSLayoutConstraint(item: flashButton, attribute: .centerY,
      relatedBy: .equal, toItem: self, attribute: .centerY,
      multiplier: 1, constant: 0))

    addConstraint(NSLayoutConstraint(item: flashButton, attribute: .width,
      relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
      multiplier: 1, constant: 55))

    if Configuration.canRotateCamera {
      addConstraint(NSLayoutConstraint(item: rotateCamera, attribute: .right,
        relatedBy: .equal, toItem: self, attribute: .right,
        multiplier: 1, constant: Dimensions.rightOffset))

      addConstraint(NSLayoutConstraint(item: rotateCamera, attribute: .centerY,
        relatedBy: .equal, toItem: self, attribute: .centerY,
        multiplier: 1, constant: 0))

      addConstraint(NSLayoutConstraint(item: rotateCamera, attribute: .width,
        relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
        multiplier: 1, constant: 55))

      addConstraint(NSLayoutConstraint(item: rotateCamera, attribute: .height,
        relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
        multiplier: 1, constant: 55))
    }
  }
}

// MARK: - Controller autolayout

extension ImagePickerController {

  func setupConstraints() {
    let attributes: [NSLayoutAttribute] = [.bottom, .right, .width]
    let topViewAttributes: [NSLayoutAttribute] = [.left, .top, .width]

    for attribute in attributes {
      view.addConstraint(NSLayoutConstraint(item: bottomContainer, attribute: attribute,
        relatedBy: .equal, toItem: view, attribute: attribute,
        multiplier: 1, constant: 0))
    }

    for attribute: NSLayoutAttribute in [.left, .top, .width] {
      view.addConstraint(NSLayoutConstraint(item: cameraController.view, attribute: attribute,
        relatedBy: .equal, toItem: view, attribute: attribute,
        multiplier: 1, constant: 0))
    }

    for attribute in topViewAttributes {
      view.addConstraint(NSLayoutConstraint(item: topView, attribute: attribute,
        relatedBy: .equal, toItem: self.view, attribute: attribute,
        multiplier: 1, constant: 0))
    }

    view.addConstraint(NSLayoutConstraint(item: bottomContainer, attribute: .height,
      relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
      multiplier: 1, constant: BottomContainerView.Dimensions.height))

    view.addConstraint(NSLayoutConstraint(item: topView, attribute: .height,
      relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
      multiplier: 1, constant: TopView.Dimensions.height))

    view.addConstraint(NSLayoutConstraint(item: cameraController.view, attribute: .height,
      relatedBy: .equal, toItem: view, attribute: .height,
      multiplier: 1, constant: -BottomContainerView.Dimensions.height))
  }
}

extension ImageGalleryViewCell {

  func setupConstraints() {

    for attribute: NSLayoutAttribute in [.width, .height, .centerX, .centerY] {
      addConstraint(NSLayoutConstraint(item: imageView, attribute: attribute,
        relatedBy: .equal, toItem: self, attribute: attribute,
        multiplier: 1, constant: 0))

      addConstraint(NSLayoutConstraint(item: selectedImageView, attribute: attribute,
        relatedBy: .equal, toItem: self, attribute: attribute,
        multiplier: 1, constant: 0))
    }
  }
}

extension ButtonPicker {

  func setupConstraints() {
    let attributes: [NSLayoutAttribute] = [.centerX, .centerY]

    for attribute in attributes {
      addConstraint(NSLayoutConstraint(item: numberLabel, attribute: attribute,
        relatedBy: .equal, toItem: self, attribute: attribute,
        multiplier: 1, constant: 0))
    }
  }
}
