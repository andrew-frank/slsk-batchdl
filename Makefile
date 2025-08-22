.PHONY: up down sldl

up:
	docker compose up -d
	@echo "⚠️ Make sure you have configured './config/sldl.conf' file according to REAMDE"
	@echo "💡 Downloads will go to the './data' directory"

down:
	docker compose down

sldl:
	docker compose exec sldl sldl -c /config/sldl.conf -p /data $(filter-out $@,$(MAKECMDGOALS))

# catch-all rule to prevent Make from trying to execute arguments as targets
%:
	@:
