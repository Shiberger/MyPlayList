//
//  SongView.swift
//  MyPlayList
//
//  Created by Hannarong Kaewkiriya on 7/2/2567 BE.
//

import SwiftUI
import AVFoundation

struct SongView: View {
    //ตัวแปรที่จะรับมาจากหน้า MainListView
    var mySong : SongInformation
    
    // ตัวแปร isPlaying นี้จะใช้เพื่อติดตามสถานะการเล่นเพลง (true คือ กำลังเล่น, false คือ หยุดเล่น)
    @State var isPlaying: Bool = false
    
    //สร้างตัวแปรท่ีแทนเครื่องเล่นไฟล์เพลง
    @State var audioPlayer : AVAudioPlayer?
    
    var body: some View {
        VStack{//เปิด VStack
            Image(uiImage: UIImage(named:"\(self.mySong.artistImage)")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            Text("\(self.mySong.artistName)")
            
            //เพิ่มปุ่มเพื่อทํางานในส่วนของการเล่นไฟล์เพลง
            HStack{//เปิด HStack
                //ปุ่ม Play
                Button(action: {
                    if !isPlaying {
                        // เริ่มเล่นเพลง
                        let songPath = Bundle.main.path(forResource:self.mySong.songFileName, ofType: "mp3")
                        let songURL = URL(fileURLWithPath: songPath!)
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: songURL)
                        self.audioPlayer?.prepareToPlay()
                        self.audioPlayer?.numberOfLoops = -1
                        self.audioPlayer?.play()
                        
                        // เปลี่ยนสถานะเป็นกำลังเล่น
                        self.isPlaying = true
                    } else {
                        // หยุดเล่นเพลง
                        self.audioPlayer?.pause()
                        
                        // เปลี่ยนสถานะเป็นหยุดเล่น
                        self.isPlaying = false
                    }
                }){
                    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                        .font(.system(size: 75))
                        .foregroundColor(.blue)
                }
                
                Text(isPlaying ? "กำลังเล่น" : "หยุดเล่น")
                    .foregroundColor(.gray)
                    .padding(.top, 10)

                
                //ปุ่ม Stop
                Button(action: {
                    self.audioPlayer?.stop()
                }){
                    Image(systemName: "stop.circle")
                        .font(.system(size: 75))
                        .foregroundColor(.red)
                }
            }//ปิด HStack
            .padding(.top, 10)
        }//ปิด VStack
        .navigationTitle("\(self.mySong.songName)")
    }
}

#Preview {
    SongView(mySong: SongInformation(songName: "เพลงทดสอบ", songFileName: "1", artistName:"ศิลปินทดสอบ", artistImage: "1.png"))
}
