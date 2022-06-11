class PromotionCode < ApplicationRecord
  # == Attributes ==================================================================

  # == Constants ===================================================================

  # == Associations ================================================================
  belongs_to :promotion
  has_one :promotion_code_mapping, dependent: :destroy
  has_one :order, through: :promotion_code_mapping

  # == Validations =================================================================
  validates :used, inclusion: [true, false]
  validates :code, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }

  # == Hooks =======================================================================

  # == Scopes ======================================================================

  # == Class Methods ===============================================================

  # == Instance Methods ============================================================

  # == Private Methods =============================================================
end
