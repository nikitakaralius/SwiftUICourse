import SwiftUI

struct AppetizerCardView: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(imageURL: appetizer.imageURL)
                .frame(width: 300, height: 225)
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.top)
                
                HStack(spacing: 20) {
                    NutritionInfo(for: "Calories", withAmount: appetizer.calories)
                    Divider()
                    NutritionInfo(for: "Carbs", withAmount: appetizer.carbs, unitOfMeasure: "g")
                    Divider()
                    NutritionInfo(for: "Protein", withAmount: appetizer.protein, unitOfMeasure: "g")
                }
                .frame(height: 50)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                AppetizerButtonLabel("$\(appetizer.price.formatted()) -  Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color.systemBackground)
        .cornerRadius(12)
        .shadow(color: .primary.opacity(0.3), radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                print("Clicked")
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                }
            }

        }
    }
}

struct NutritionInfo: View {
    private let nutrition: String
    private let amount: Int
    private let unitOfMeasure: String?
    
    init(for nutrition: String, withAmount amount: Int, unitOfMeasure: String? = nil) {
        self.nutrition = nutrition
        self.amount = amount
        self.unitOfMeasure = unitOfMeasure
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Text(nutrition)
                .font(.caption)
                .bold()
            
            Text("\(amount) \(unitOfMeasure ?? "")")
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}

struct AppetizerCardView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCardView(appetizer: MockData.sampleAppetizer)
    }
}
