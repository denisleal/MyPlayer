//
//  PlayerUIView.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-07.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct PlayerUIView : View {
    let playerView = PlayerView(mediaUrl: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
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
