module Shop
  class ProductsController < ShopController
    skip_before_action :authenticate_user!

    def show
      run Operations::Shop::Product::Load
    end
  end
end
