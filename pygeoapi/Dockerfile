# Build the pygeoapi service image on top of the official one.
#
# This applies a workaround for an upstream bug (pygeoapi master, 0.25.dev0,
# 2026-09): in pygeoapi/api/tiles.py the TileMatrixSets HTML endpoints call
#
#     render_j2_template(api.tpl_config, api.tpl_config, ...)
#
# i.e. the *entire* API configuration is passed as the template configuration.
# render_j2_template() therefore never finds a "path" key and silently falls
# back to the pygeoapi default templates, ignoring server.templates.path.
# Every other endpoint passes api.config['server']['templates'] instead, which
# is why the TileMatrixSets HTML pages were the only ones not rendered with
# the custom (hand-drawn) theme.
#
# If upstream fixes this bug the sed below simply has no effect anymore.
FROM geopython/pygeoapi:latest

RUN set -eux; \
    f=/pygeoapi/pygeoapi/api/tiles.py; \
    test -f "$f"; \
    sed -i "s/render_j2_template(api.tpl_config, api.tpl_config,/render_j2_template(api.tpl_config, api.config['server']['templates'],/g" "$f"
