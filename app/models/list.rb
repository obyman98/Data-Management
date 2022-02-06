class List < ApplicationRecord

  def self.upload_leads(params)

    lists = []
    CSV.parse(params[:hide2], headers: true) do |row|
      lists << Hash["name" => row[params[:name]], "url" => row[params[:url]], "city" => row[params[:city]], "state" => row[params[:state]], "asking_price" => row[params[:asking_price]], "revenue" => row[params[:revenue]], "cash_flow" => row[params[:cash_flow]], "ebitda" => row[params[:ebitda]], "sde" => row[params[:sde]], "industry" => row[params[:industry]], "business_summary" => row[params[:business_summary]]]
    end

    List.import(lists)

  end
end