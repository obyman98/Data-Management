class List < ApplicationRecord

  scope :location_multiple_terms, ->(search) {
    List.ransack(location_cont_any: search.split).result
  }

  def self.ransackable_scopes(auth_object = nil)
    [ :location_multiple_terms]
  end

  def self.upload_leads(params)

    lists = []
    CSV.parse(params[:hide2], headers: true) do |row|
      lists << Hash["list_id" => row[params[:list_id]], "name" => row[params[:name]], "url" => row[params[:url]], "location" => row[params[:location]], "asking_price" => row[params[:asking_price]], "revenue" => row[params[:revenue]], "cash_flow" => row[params[:cash_flow]], "ebitda" => row[params[:ebitda]], "sde" => row[params[:sde]], "industry" => row[params[:industry]], "business_summary" => row[params[:business_summary]]]
    end

    List.import(lists)

  end
end