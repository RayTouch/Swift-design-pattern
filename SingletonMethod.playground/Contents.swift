import UIKit

class ImageCache {
    static let share = ImageCache()
    
    private var name: String = ""
    
    private init() {
        self.name = ""
    }
    
    func saveImage(_ name: String) {
        self.name = name
    }
    
    func getImage() -> String {
        return self.name
    }
}

ImageCache.share.getImage() // ""

ImageCache.share.saveImage("JoJo")

ImageCache.share.getImage() // JoJo
