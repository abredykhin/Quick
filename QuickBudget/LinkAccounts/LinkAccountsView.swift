//
//  LinkAccountsView.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 8/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//

import SwiftUI

struct LinkAccountsView: View {
    @EnvironmentObject var model: LinkAccountModel
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var buttonGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors:
                [Color(red: 63.0/255, green: 67.0/255, blue: 76.0/255),
                 Color(red: 80.0/255, green: 86.0/255, blue: 98.0/255)]),
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(Color("BlueBg"))
            
            VStack(alignment: .center) {
                if (!self.model.hasAccounts) {
                    Text("Let's add some accounts!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(radius: 4)
                        .padding(.top, 120)
                } else {
                    AccountListView()
                }
                
                Spacer()
                
                LinkAccountButton()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $model.currentlyLinking) {
            PlaidLinkWrapper(model: self.model)
        }
    }
}

#if DEBUG
struct LinkAccountsView_Previews: PreviewProvider {
    static let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static var previews: some View {        
        LinkAccountsView()
            .environmentObject(LinkAccountModel(managedContext: managedObjectContext))
            .scaleEffect(0.5)
    }
}
#endif

struct LinkAccountButton: View {
    @EnvironmentObject var model: LinkAccountModel
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        Button(action: { self.model.currentlyLinking = true}) {
            HStack(spacing: 20) {
                Text("LINK ACCOUNT")
                    .foregroundColor(.white)
                    .font(.headline)
                    .shadow(radius: 4)
                    .padding(.trailing, 40)
                
                ZStack {
                    Circle()
                        .fill(Color(red: 179.0 / 255, green: 212.0 / 255, blue: 253.0 / 255))
                        .frame(width: 40, height: 40, alignment: .center)
                        .shadow(radius: 10)
                    Image(systemName: "link")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                }
            }
            .padding(.bottom, 40)
        }
    }
}

struct AccountView: View {
    let account: CDAccount
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.red.opacity(0.75))
                .frame(width: 200, height: 50)
            
            Button(action: {}) {
                HStack {
                    Text(account.name!)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    if account.balances != nil {
                        Text(account.balances!.current!.stringValue)
                    }
                }
            }
        }
    }
}

struct AccountListView: View {
    @FetchRequest(fetchRequest: CDAccount.allAccountsFetchRequest()) var accounts: FetchedResults<CDAccount>
    
    var body: some View {
        ScrollView {
            ForEach(self.accounts, id: \.accountId) { account in
                AccountView(account: account)
            }
        }
        .animation(.linear)
        .padding()
        .fixedSize()
    }
}
