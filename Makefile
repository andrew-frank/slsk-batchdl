.PHONY: up down sldl

up:
	docker compose up -d
	@echo "⚠️ Make sure you have configured './config/sldl.conf' file according to REAMDE"
	@echo "💡 Downloads will go to the './data' directory"

down:
	docker compose down

# access to configured sldl cli, e.g. `make sldl https://open.spotify.com/playlist/123456` to download a playlist
sldl:
	docker compose exec sldl sldl -c /config/sldl.conf -p /data $(filter-out $@,$(MAKECMDGOALS))

spotify-login:
	@echo "🔐 Getting Spotify refresh token..."
	@echo "⚠️  Make sure you have spotify-id and spotify-secret in ./config/sldl.conf"
	@echo "📋 Copy the 'spotify-refresh=' token from the output and add it to your config"
	@echo ""
	docker compose exec sldl sldl spotify-likes -c /config/sldl.conf -n 1 --print tracks

# catch-all rule to prevent Make from trying to execute arguments as targets
%:
	@:
