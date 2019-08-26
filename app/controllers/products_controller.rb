class ProductsController < ApplicationController

    def body
        @product = Product.find(params[:id])

        render plain: @product.description
    end

    def create        
        @product = Product.new(product_params)
       # binding.pry
        @product.save
        #binding.pry
        redirect_to products_path
    end

    def inventory
        @product = Product.find(params[:id])

        render plain: @product.inventory > 0 ? true : false
    end

    def description
        @product = Product.find(params[:id])

        render plain: @product.description
    end

    def index
        @products = Product.all
    end


    private

    def product_params
        params.require(:product).permit(:name, :price, :inventory, :description)
    end
end
