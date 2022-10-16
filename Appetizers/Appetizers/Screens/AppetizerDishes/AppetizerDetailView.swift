import SwiftUI

struct AppetizerDetailView: View {
    @Binding var isShowing: Bool
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(imageURL: appetizer.imageURL)
                .frame(width: 300, height: 225)
                .aspectRatio(contentMode: .fit)
            AppetizerDescription(appetizer: appetizer)
            Spacer()
            OrderButton(for: appetizer)
        }
        .card()
        .withCloseButton(at: .topTrailing, controls: $isShowing)
    }
}

fileprivate struct AppetizerDescription: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
            
            HStack(spacing: 20) {
                NutritionUnit(of: "Calories",
                              withAmount: appetizer.calories)
                Divider()
                NutritionUnit(of: "Carbs",
                              withAmount: appetizer.carbs,
                              unitOfMeasure: "g")
                Divider()
                NutritionUnit(of: "Protein",
                              withAmount: appetizer.protein,
                              unitOfMeasure: "g")
            }
            .frame(height: 50)
        }
    }
}

fileprivate struct NutritionUnit: View {
    private let nutrition: String
    private let amount: Int
    private let unitOfMeasure: String?
    
    init(of nutrition: String, withAmount amount: Int, unitOfMeasure: String? = nil) {
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

fileprivate struct OrderButton: View {
    private let appetizer: Appetizer
    
    init(for appetizer: Appetizer) {
        self.appetizer = appetizer
    }
    
    var body: some View {
        Button {
            
        } label: {
            AppetizerButtonLabel("$\(appetizer.price.formatted()) -  Add to Order")
        }
        .padding(.bottom, 30)
    }
}

fileprivate extension View {
    func card() -> some View {
        return self.frame(width: 300, height: 525)
            .background(Color.systemBackground)
            .cornerRadius(12)
            .shadow(color: .primary.opacity(0.3), radius: 40)
    }
}

fileprivate extension View {
    func withCloseButton(at alignment: Alignment, controls isShowing: Binding<Bool>) -> some View {
        return self.overlay(alignment: .topTrailing) {
            Button {
                isShowing.wrappedValue = false
            } label: {
                CloseButtonLabel()
            }
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isShowing: .constant(true),
                            appetizer: MockData.sampleAppetizer)
    }
}
