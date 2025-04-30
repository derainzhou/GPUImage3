//
//  ViewController.swift
//  GPUImage3
//
//  Created by DerainZhou on 04/30/2025.
//  Copyright (c) 2025 DerainZhou. All rights reserved.
//

import UIKit
import GPUImage3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let originalUIImage = UIImage(named: "IMG_3705.jpeg") else { return }

        let filter = BrightnessAdjustment()
        filter.brightness = 0.2
        let pictureInput = PictureInput(image: originalUIImage)
        pictureInput.addTarget(filter)

        let pictureOutput = PictureOutput()
        filter.addTarget(pictureOutput)

        // 设置回调
        pictureOutput.imageAvailableCallback = { processedUIImage in
            print("图片处理完成回调触发！处理后的图像: \(processedUIImage)")
        }

        pictureInput.processImage(synchronously: true)
    }

}
