import SwiftUI

struct ImageRow: View {
    
    var image: ImageModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image.thumbnailUrl) ){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 50)
            
            Spacer()
            Text(image.title)
            
            Spacer()
            
        }
    }
}

struct ImagesRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(image: ImageModel(albumId: 123,
                                   id : 23, title: "Midnight in Paris", url: "https://", thumbnailUrl: "https://"))
    }
}
