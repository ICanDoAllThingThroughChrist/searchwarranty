class CartsrsController < ApplicationController
  def index
    render 'index'
  end

  def new
    @cartsr= Cartsr.new
  end

  def create
    binding.pry

  end

end
