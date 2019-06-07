//
//  PlayerUIView.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-07.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct PlayerUIView : View {
    let playerView = PlayerView()

    var body: some View {
        VStack {
            playerView
            HStack(spacing: 100.0) {
                Button(action: {
                    self.playerView.stopVideo()
                }) {
                    Text("Stop")
                }

                Button(action: {
                    self.playerView.playVideo()
                }) {
                    Text("Play")
                }
            }
            .padding()

        }
    }
}

#if DEBUG
struct PlayerUIView_Previews : PreviewProvider {
    static var previews: some View {
        PlayerUIView()
    }
}
#endif
