# Base image
FROM afdaniele/compose-arm32v7:latest

# install packages
RUN python3 $COMPOSE_DIR/public_html/system/lib/python/compose/package_manager.py \
  --install duckietown_watchtower

# configure \compose\
RUN python3 $COMPOSE_DIR/configure.py \
  --guest_default_page "mission-control" \
  --website_name "Watchtower Dashboard" \
  --login_enabled 1 \
  --cache_enabled 1

# install ENTRYPOINT script
ADD assets/entrypoint_watchtower.sh /root/entrypoint_watchtower.sh

# configure ENTRYPOINT
ENTRYPOINT ["/root/entrypoint_watchtower.sh"]
