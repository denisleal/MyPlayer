//
//  PlayerBottomBar.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-11.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct PlayerBottomBar : View {
    let playButtonAction: () -> Void
    @State var isPlaying = false

    var body: some View {
        HStack() {
            Spacer()

            Button(action: {
                print("button pressed")
                self.isPlaying.toggle()
                DispatchQueue.main.async {
                    self.playButtonAction()
                }
            }) {
                if self.isPlaying {
                    Image(systemName: "stop.fill")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50, alignment: .center)
                } else {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }

            Spacer()
        }
    }
}

#if DEBUG
struct PlayerBottomBar_Previews : PreviewProvider {
    static var previews: some View {
        PlayerBottomBar(playButtonAction: {})
    }
}
#endif
