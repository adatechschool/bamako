import SwiftUI

struct ImagesList: View {
    
    var images : [ImageModel]
    
    var body: some View {
        List (images) {image in
            ImageRow(image: image)}
            
        }
    }

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ImagesList(images: [ImageModel]())
    }
}

