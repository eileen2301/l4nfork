module Operations::Shop::CartItem
  class IncreaseQuantity < RailsOps::Operation::Model::Load
    policy :on_init do
      authorize! :use, :shop
    end

    load_model_authorization_action nil

    model ::CartItem

    def perform
      fail MaxQuantityReached if model.product.inventory <= model.quantity

      model.quantity += 1
      model.save!
    end
  end

  class MaxQuantityReached < StandardError; end
end
