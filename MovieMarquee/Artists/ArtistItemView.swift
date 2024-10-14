import SwiftUI
import Kingfisher

struct ArtistItemView: View {

    private var artist: Creditable

    internal init(artist: Creditable) {
        self.artist = artist
    }

    fileprivate func artistImage() -> some View {
        KFImage(URL(string: artist.getPosterUrl()))
            .resizable()
            .scaledToFill()
            .frame(width: 105, height: 160)
            .clipped()
    }

    fileprivate func artistLabel() -> some View {
        return Text(artist.getTitle())
            .font(.system(size: 15))
            .foregroundColor(.primary)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.7)
            .padding(
                EdgeInsets(
                    top: 4,
                    leading: 2,
                    bottom: 4,
                    trailing: 2)
            )
    }

    var body: some View {
        VStack(alignment: .center) {
            artistImage()
            artistLabel()
        }
        .frame(width: 105, height: 190)
        .border(Color.primary, width: 1)
    }
}