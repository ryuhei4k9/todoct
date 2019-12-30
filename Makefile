.PHONY: All install

.PHONY: help
help: ## make taskの説明を表示する
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: dev
dev: ## rails s を実行
	docker-compose up -d
	docker-compose exec -T app rails db:migrate
	docker-compose exec app rails s

.PHONY: console
console:
	docker-compose up -d
	docker-compose exec app rails c

.PHONY: dbconsole
dbconsole:
	docker-compose up -d
	docker-compose exec app rails db

.PHONY: docker-bash
docker-bash: ## appコンテナにログインする
	docker-compose exec app bash --login

.PHONY: rspec
rspec: ## RSpecを実行する
	docker-compose exec -T app rails db:migrate RAILS_ENV=test
	docker-compose exec -T app rspec

.PHONY: rails-routes
rails-routes: ## rails routesを表示する
	docker-compose exec app rails routes

.PHONY: credencial-edit
credencial-edit: ## config/credentials.yml.encにデータを書き込む
	docker-compose exec app bin/rails credentials:edit
