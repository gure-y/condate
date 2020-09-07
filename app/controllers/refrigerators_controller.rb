class RefrigeratorsController < ApplicationController
  before_action :search_refrigerator

  def index
    @refrigerators = Refrigerator.all
    set_refurigerator_culumn
  end

  def search
    @results = @r.result.order("RAND()").limit(1)
  end

  def empty
    
  end

  private
  def search_refrigerator
    @r = Refrigerator.ransack(params[:q])
    @r.combinator = 'or'
  end

  def set_refurigerator_culumn
    @main = Refrigerator.select("main").distinct
    @meat = Refrigerator.select("meat").distinct
    @fish = Refrigerator.select("fish").distinct
    @egg = Refrigerator.select("egg").distinct
    @tofu = Refrigerator.select("tofu").distinct
    @begetable = Refrigerator.select("begetable").distinct
  end
end
