//
//  DiscoverBookTVCell.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit
import Stevia

final class DiscoverBookTVCell: UITableViewCell {
    static let identifier = "\(DiscoverBookTVCell.self)"
    
    private let coverImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline,
                                          compatibleWith: self.traitCollection)
        label.textColor = UIColor.label
        label.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline,
                                          compatibleWith: self.traitCollection)
        label.textColor = UIColor.lightGray
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    private var item: DiscoverBookTVCellModelProxy!
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        // Unnecessary to decode the objects and encode them here, since I don't use Storyboards;
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        coverImageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
    
    private func configureWith(_ item: DiscoverBookTVCellModelProxy) {
        self.item = item
        
        self.titleLabel.text = item.title
        self.descriptionLabel.text = item.description
    }
    
    private func setupUI() {
        subviews(coverImageView, vStackView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        coverImageView
            .leading(Constants.CoverImageView.leadingPadding)
            .top(Constants.CoverImageView.topPadding)
            .height(Constants.CoverImageView.height)
            .width(Constants.CoverImageView.width)
        
        vStackView.Leading == coverImageView.Trailing + Constants.VStackView.leadingPadding
        vStackView
            .fillVertically(padding: Constants.VStackView.vPadding)
            .trailing(Constants.VStackView.trailingPadding)
    }
}


extension DiscoverBookTVCell {
    fileprivate enum Constants {
        enum CoverImageView {
            static let leadingPadding: CGFloat = 16.0
            static let topPadding: CGFloat = 5.0
            static let height: CGFloat = 90.0
            static let width: CGFloat = 60.0
        }
        
        enum VStackView {
            static let leadingPadding: CGFloat = 10.0
            static let vPadding: CGFloat = 5.0
            static let trailingPadding: CGFloat = 16.0
        }
    }
}
