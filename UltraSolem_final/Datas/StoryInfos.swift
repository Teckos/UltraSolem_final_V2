
import SwiftUI

struct Story : Identifiable, Hashable {
var id = UUID()

var planete: String //planète de rattachement
var choix1: String
var choix2: String
var choix1vu: Bool
var choix2vu: Bool
var jour: Int //pour le journal
var dateDecouverte: String //voir type
var titre: String
var mainStory: String
var resume: String //nécessaire ?
    var type :String
}

