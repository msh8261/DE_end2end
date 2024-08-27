up:
	docker compose --env-file .env up --build -d

creat_database: 
	docker exec etl python pipeline/create_db.py

warehouse: 
	winpty docker exec -ti warehouse psql f'postgresql://postgres:{POSTGRES_PASSWORD}@host.docker.internal:5432/retail_sales'
# CREATE SCHEMA landing_area; 
# CREATE SCHEMA staging_area

etl: 
	docker exec etl python pipeline/main_pipeline.py

# dashboard: http://localhost:3000

pytest:
	docker exec etl python -m pytest -p no:warnings -v


format:
	docker exec etl python -m black -S --line-length 79 .


isort:
	docker exec etl isort .


type:
	docker exec etl mypy --ignore-missing-imports .


lint: 
	docker exec etl flake8 .


ci: isort format type lint pytest


down: 
	docker compose down 