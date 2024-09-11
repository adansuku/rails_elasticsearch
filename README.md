## Elastic Search
docker run -d --name elasticsearch -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:8.10.0

## Indexing elastic search
Article.__elasticsearch__.create_index!(force: true)
Article.import

## generate articles
rails articles:generate

## Example
![Example](https://imgur.com/fE3vqgW.png)

Readme ongoing...