class Seat < ApplicationRecord
  # == Attributes ==================================================================

  # == Constants ===================================================================

  # == Associations ================================================================
  belongs_to :seat_map
  belongs_to :seat_category
  belongs_to :ticket, optional: true

  # == Validations =================================================================

  # == Hooks =======================================================================

  # == Scopes ======================================================================

  # == Class Methods ===============================================================

  # == Instance Methods ============================================================
  def color
    if ticket
      'red'
    else
      seat_category.color_for_view
    end
  end

  # == Private Methods =============================================================
end
