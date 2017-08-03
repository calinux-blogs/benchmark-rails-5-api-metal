module V1
  module DataSourcesControllerViews
    extend ActiveSupport::Concern

    def index_view(data_sources)
      data_sources.map do |data_source|
        show_view(data_source)
      end
    end

    def show_view(data_source)
      { 
        id: data_source.id,
        name: data_source.name,
        uid: data_source.uid,
        desc: data_source.description,
        field1: data_source.some_field,
        field2: data_source.some_string_field,
        item_names: data_source.items,
        item_ids: data_source.item_ids,
        meta: data_source.meta
      }
    end
  end
end
