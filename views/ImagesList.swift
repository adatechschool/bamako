import SwiftUI

struct ImagesList: View {
    
    @StateObject var api = Api()
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                LazyVStack {
                    ForEach(api.images, id: \.self) { image in
                        ImageRow(image: image)
                            .onAppear(){
                                api.loadMoreContent(currentItem: image)
                            }
                    }
                }
            }
        }
        .navigationTitle("")
        
    }
}

//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagesList(images: [ImageModel]())
//    }
//}
