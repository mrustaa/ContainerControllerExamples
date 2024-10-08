import UIKit
import ContainerControllerSwift

// MARK: - State

extension CryptoTitleItem {
  struct State {
    var titleText: String?
    var subtitleText: String?
    var text2: String?
    var text3: String?
    var text4: String?
    var text5: String?
    var text6: String?
    var text7: String?
    var text8: String?
    var text9: String?
    var text10: String?
    var text11: String?
    var text12: String?
    var image13: UIImage?
    var image14: UIImage?
    var handlers: Handlers = .init()
  }
  struct Handlers {
    var onClickAt: (()->(Void))?
  }
}

// MARK: - Item

class CryptoTitleItem: TableAdapterItem {
  init(state: CryptoTitleItem.State) {
    let cellData =  CryptoTitleCellData(state: state)
    super.init(cellClass: CryptoTitleCell.self, cellData: cellData)
  }
}

// MARK: - Data

class CryptoTitleCellData: TableAdapterCellData {

  var state: CryptoTitleItem.State

  init(state: CryptoTitleItem.State) {
    self.state = state
    super.init()
    // self.cellClickCallback = state.handlers.onClickAt
  }
  
  override public func cellHeight() -> CGFloat {
    // let calcHeight = calculateLabel(
    //   text: state.titleText,
    //   padding: 16,
    //   titleFont: SFProText.regular.size(.headline)
    // )
    return Self.cHeight()
  }
  
  public static func cHeight() -> CGFloat  {
    return 536
  }

  override public func canEditing() -> Bool {
    return editing
  }
}

// MARK: - Cell

class CryptoTitleCell: TableAdapterCell {
  
  public var data: CryptoTitleCellData?
  
  @IBOutlet private weak var titleLabel: UILabel?
  @IBOutlet private weak var subtitleLabel: UILabel?
  @IBOutlet private weak var label2: UILabel?
  @IBOutlet private weak var label3: UILabel?
  @IBOutlet private weak var label4: UILabel?
  @IBOutlet private weak var label5: UILabel?
  @IBOutlet private weak var label6: UILabel?
  @IBOutlet private weak var label7: UILabel?
  @IBOutlet private weak var label8: UILabel?
  @IBOutlet private weak var label9: UILabel?
  @IBOutlet private weak var label10: UILabel?
  @IBOutlet private weak var label11: UILabel?
  @IBOutlet private weak var label12: UILabel?
  @IBOutlet private weak var imageView13: UIImageView?
  @IBOutlet private weak var imageView14: UIImageView?
  
    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet override var selectedView: UIView? { didSet { } }
  @IBOutlet var cardView: UIView?
  @IBOutlet var button: UIButton?
  
  override func awakeFromNib() {
    separator(hide: true)
    button?.tapHideAnimation(
      view: imgIcon,
      type: .alpha(0.5),
      callback: { [weak self] type in
        if type == .touchUpInside {
          self?.data?.state.handlers.onClickAt?()
        }
      }
    )
  }
  
  override func fill(data: TableAdapterCellData?) {
    guard let data = data as? CryptoTitleCellData else { return }
    self.data = data
    if let v = data.state.titleText { titleLabel?.text = v }
    if let v = data.state.subtitleText { subtitleLabel?.text = v }
    if let v = data.state.text2 { label2?.text = v }
    if let v = data.state.text3 { label3?.text = v }
    if let v = data.state.text4 { label4?.text = v }
    if let v = data.state.text5 { label5?.text = v }
    if let v = data.state.text6 { label6?.text = v }
    if let v = data.state.text7 { label7?.text = v }
    if let v = data.state.text8 { label8?.text = v }
    if let v = data.state.text9 { label9?.text = v }
    if let v = data.state.text10 { label10?.text = v }
    if let v = data.state.text11 { label11?.text = v }
    if let v = data.state.text12 { label12?.text = v }
    if let v = data.state.image13 { imageView13?.image = v }
    if let v = data.state.image14 { imageView14?.image = v }
    
  }
}
