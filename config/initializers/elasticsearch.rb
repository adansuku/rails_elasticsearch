Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: ENV['ELASTICSEARCH_URL'] || 'http://localhost:9200',
  user: 'elastic',
  password: ENV['ELASTIC_SEARCH_PASSWORD']
)
