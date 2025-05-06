import UIKit

import SnapKit
import Then

final class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let productNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .customFont(weight: .regular, size: 16)
        $0.textAlignment = .left
    }
    
    private let productPriceLabel = UILabel().then {
        $0.textColor = .orange
        $0.textAlignment = .left
        $0.font = .customFont(weight: .bold, size: 15)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setUI() {
        contentView.addSubviews(productImageView, productNameLabel, productPriceLabel)
    }
    
    private func setLayout() {
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(productImageView.snp.width)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        productPriceLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.lessThanOrEqualToSuperview().inset(8)
        }
    }
    
    private func setStyle() {
        contentView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 8
            $0.layer.masksToBounds = true
        }
    }
    
    // MARK: - Configure Cell
    func configure(model: ItemModel) {
        productImageView.image = model.itemImg
        productNameLabel.text = model.name
        productPriceLabel.text = model.price + "원"
    }
}

