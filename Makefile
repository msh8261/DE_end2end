format:
	docker run --rm my-image black -S --line-length 79 .

isort:
	docker run --rm my-image isort .

type:
	docker run --rm my-image mypy --ignore-missing-imports .

lint:
	docker run --rm my-image flake8 .

pytest:
	docker run --rm my-image pytest -p no:warnings -v


ci: format isort type lint pytest

run_pytest:
	pytest -p no:warnings -v
