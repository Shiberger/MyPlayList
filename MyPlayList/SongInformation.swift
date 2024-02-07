//
//  SongInformation.swift
//  MyPlayList
//
//  Created by Hannarong Kaewkiriya on 7/2/2567 BE.
//

import UIKit
class SongInformation: NSObject {
    //ตัวแปรที่จะเก็บค่าข้อมูล SongInformation แต่ล่ะชุด
    var songName : String
    var songFileName : String
    var artistName : String
    var artistImage : String
    //Initializer แบบไม่มีการส่งผ่าน Parameter
    override init() {
        self.songName = ""
        self.songFileName = ""
        self.artistName = ""
        self.artistImage = ""
    }
    init(songName : String, songFileName : String, artistName : String,
         artistImage : String){
        self.songName = songName
        self.songFileName = songFileName
        self.artistName = artistName
        self.artistImage = artistImage
    }
}
