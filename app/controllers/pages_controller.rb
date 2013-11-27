class PagesController < ApplicationController
  def contact
  end

  def home
  end

  def search
    @allServices=Service.all
    @hmlist=@allServices.reject{|s| s.listings.count==0}.map{|s| {"minPrice"=>s.listings.reject{|l| l.endDate < Time.now.to_date }.sort_by(&:minPrice).first.minPrice , "maxPrice"=>s.listings.sort_by(&:maxPrice).last.maxPrice,"availability"=>"Everywhere","Title"=>s.title,"initDate"=>s.listings.sort_by(&:startDate).first.startDate,"finalDate"=>s.listings.sort_by(&:endDate).last.endDate,"id"=>s.id}}
  end

  def forgot_password
    
  end
end
