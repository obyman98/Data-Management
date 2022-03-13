ActiveAdmin.register List do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :list_id, :name, :url, :city, :state, :asking_price, :revenue, :cash_flow, :ebitda, :sde, :industry, :business_summary
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :url, :location, :asking_price, :revenue, :cash_flow, :ebitda, :sde, :industry, :business_summary]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  filter :state, as: :select, collection: proc { List.all.map(&:state).compact.uniq }
  filter :cash_flow, as: :range
  filter :asking_price, as: :range
  filter :ebitda, as: :range
  filter :sde, as: :range
  filter :revenue, as: :range

  action_item only: :index do
    link_to 'Upload File', action: 'upload_json'
  end

  collection_action :upload_json do
    render 'admin/upload_json/upload.erb'
  end

  collection_action :get_layout, method: :post do
    @data = File.read(params[:csv_file], :encoding => 'ISO-8859-1')
    @headers = CSV.read(params[:csv_file], :encoding => 'ISO-8859-1', headers: true).headers
    render 'admin/upload_json/layout.erb'
  end

  collection_action :import_csv, method: :post do
    List.upload_leads(params)
    # @table = CSV.parse(File.read(params[:json_file]), headers: true)
    flash[:notice] = "JSON file imported successfully!"
    redirect_to action: :index
  end

  index do
    selectable_column
    id_column
    column :list_id
    column :name
    column :url
    column :city
    column :state
    column :asking_price
    column :revenue
    column :cash_flow
    column :ebitda
    column :sde
    column :industry
    column :business_summary
    actions
  end


end