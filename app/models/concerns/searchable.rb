module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings do
      mappings dynamic: false do
        indexes :title, type: 'text'
        indexes :content, type: 'text'
        indexes :category, type: 'keyword'
        indexes :published_at, type: 'date', format: 'yyyy-MM-dd||strict_date_optional_time'
      end
    end

    def self.advanced_search(query:, category: nil, from: nil, to: nil)
      must_queries = []

      if query.present?
        must_queries << {
          bool: {
            should: [
              { wildcard: { title: "*#{query.downcase}*" } },
              { wildcard: { content: "*#{query.downcase}*" } }
            ]
          }
        }
      end

      filter_queries = []
      filter_queries << { term: { category: } } if category.present?
      filter_queries << { range: { published_at: { gte: from, lte: to } } } if from.present? && to.present?

      params = {
        query: {
          bool: {
            must: must_queries,
            filter: filter_queries
          }
        }
      }
      __elasticsearch__.search(params).records.to_a
    end
  end
end
