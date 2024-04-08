# FROM directus/directus:10.10.5
# USER root
# RUN corepack enable \
#   && corepack prepare pnpm@8.1.1 --activate \
#   # Currently required, we'll probably address this in the base image in future release
#   && chown -R node:node /directus /directus/database /directus/extensions /directus/uploads


# # USER node
# # RUN pnpm install directus-extension-group-modal-interface directus-extension-api-trigger-interface directus-extension-board-layout directus-extension-computed-interface directus-extension-grid-layout directus-extension-inline-form-interface

# # Try out another time:
# # directus-extension-seo // not working as of now. Wait for update > 1.3.2
# # directus-extension-flow2pdf // not needed for now


