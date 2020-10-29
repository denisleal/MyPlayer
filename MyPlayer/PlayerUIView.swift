//
//  PlayerUIView.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-07.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct PlayerUIView : View {
    let playerView = PlayerView(mediaUrl: "http://s1tvusa.ddns.net:25461/denisflu@gmail.com/67c9dba6f08f57ab702fb6cc3e5376a9cbb00f93d7673479767c64dc03ee9a2706211092c0969e8459723e48e74c07f9a395f0abef7a3cd18bdc43518abddd6a/2851"
    )

    var player: VLCMediaPlayer {
        return playerView.player
    }

    var body: some View {
        ZStack {
            playerView
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                PlayerBottomBar(playButtonAction: didTapPlayButton)
            }
        }
    }

    private func didTapPlayButton() {
        if player.isPlaying {
            player.stop()
        } else {
            player.play()
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
