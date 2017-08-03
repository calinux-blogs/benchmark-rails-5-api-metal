module V1
  class DataSourcesController < ApiController
    include V1::DataSourcesControllerViews

    before_action :setup_data_source, only: [:show, :update]
    before_action :validate_index_params, only: [:index]
    before_action :validate_create_params, only: [:create]
    before_action :validate_show_params, only: [:show]
    before_action :validate_update_params, only: [:update]

    def hello
      render json: 'hello'
    end

    def index
      render json: index_view(DataSource.page(params[:page]).per(params[:per_page] || 50))
    end

    def create
      result = DataSource.create!(data_source_params)
      render json: show_view(result)
    end

    def show
      render json: show_view(@data_source)
    end

    def update
      @data_source.update!(data_source_params)
      render json: show_view(@data_source)
    end

    private

    def validate_index_params
    end

    def validate_create_params
      params.require(:name)
      params.require(:uid)
      params.require(:external_key)

      if params[:meta].present?
        params.fetch(:meta).require(:email)
        params.fetch(:meta).require(:domain)
        params.fetch(:meta).require(:url)
        params.fetch(:meta).require(:password)
      end
    end

    def validate_show_params
      params.require(:id)
    end

    def validate_update_params
      params.require(:id)
    end

    def setup_data_source
      @data_source = DataSource.find(params[:id])
    end

    def data_source_params
      permitted_params = params.permit(
        :name,
        :uid,
        :external_key,
        :description,
        :some_field,
        :some_other_field,
        :transaction_value,
        :transaction_time,
        :some_string_field,
        :some_other_string_field,
        items: [],
        item_ids: [],
        meta: [:email, :domain, :url, :password, :mac, :slug, :userna]
      )
      permitted_params[:meta] = @data_source.meta.merge(permitted_params[:meta]) if permitted_params[:meta]
      permitted_params
    end

  end
end