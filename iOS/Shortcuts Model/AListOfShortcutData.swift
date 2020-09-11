//
//  AListOfShortcutData.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 04..
//

import Foundation


let AListOfShortcutData : [ShortcutData] = [
    .init(name: "20 minutes focus",
          description:"""
This Shortcut will set up a timer for 20 minutes.
And sets your device to silent and Do Not Disturb.
It also turns the brightness of your screen to Zero.
""",
          nameOfSymbol: "stopwatch",
          link: URL(string:"https://www.icloud.com/shortcuts/123e4212a5654773b2871a08f8ad8d02")!,
          color: 0.1,
          credit: "@Hamoonist"
          ),
    
    .init(name: "Water Eject",
          description: """
Run this shortcut if water is in your iPhone's speakers.
It plays sounds to eject the water.
Similar to Apple Watch.
""",
          nameOfSymbol: "drop",
          link: URL(string: "https://www.icloud.com/shortcuts/a7ba526c013f4470979ad5b7438c471f")!,
          color: 0.5,
          credit: "shortcutsgallery.com"
          )
]
