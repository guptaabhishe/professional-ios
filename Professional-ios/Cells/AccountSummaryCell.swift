//
//  AccountSummaryCell.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 14/09/23.
//

import UIKit

class AccountSummaryCell:UITableViewCell{
    
    enum AccountType:String {
      
      case Banking
      case CreditCard
      case Investment
    }
    
    struct ViewModel{
        let accountType:AccountType
        let accountName:String
        let balance:Decimal
        
        var balanceAsAttributedString:NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    let viewModel:ViewModel? = nil
    
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight:CGFloat = 112
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    
    private func setup(){
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = false
        typeLabel.text = "Account type"
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = appColor
        
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlineView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Account Name"
        nameLabel.font = .preferredFont(forTextStyle: .body)
        contentView.addSubview(nameLabel)
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.text = "Some Balance"
        balanceLabel.font = .preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "929,466", cents: "23")
        balanceAmountLabel.textAlignment = .right
        
        contentView.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        contentView.addSubview(chevronImageView)
        
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            
            underlineView.widthAnchor.constraint(equalTo: typeLabel.widthAnchor) ,
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            
            balanceStackView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1)
            
        ])
        
    }
}

extension AccountSummaryCell{
    private func makeFormattedBalance(dollars:String , cents:String) -> NSMutableAttributedString {
        
        let dollarSignAttributes:[NSAttributedString.Key:Any] = [.font:UIFont.preferredFont(forTextStyle: .callout), .baselineOffset:8]
        
        let dollarAttribues:[NSAttributedString.Key:Any] = [.font:UIFont.preferredFont(forTextStyle: .title1)]
        
        let centAttributes:[NSAttributedString.Key:Any] = [.font:UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset:8]
        
        let rootString = NSMutableAttributedString(string: "$" , attributes: dollarSignAttributes)
        rootString.append(NSAttributedString(string: dollars , attributes: dollarAttribues))
        rootString.append(NSAttributedString(string: cents, attributes: centAttributes))
        
        return rootString
        
    }
}

extension AccountSummaryCell {
    func configure(with vm:ViewModel){
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsAttributedString
        
        switch vm.accountType{
        case .Banking:
            balanceLabel.text = "Current balance"
            break
        case .Investment:
            balanceLabel.text = "Current balance"
            break
        case .CreditCard:
            balanceLabel.text = "Value  "
            break
        }
    }
}
