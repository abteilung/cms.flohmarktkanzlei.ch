# FROM directus/directus:10.12.1

# # Switch to root user
# USER root

# # Install tzdata package
# RUN apk add --no-cache tzdata

# # Set the timezone
# RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && echo "Europe/Zurich" > /etc/timezone

# # # Copy the entrypoint script into the container
# # COPY entrypoint.sh /entrypoint.sh

# # # Ensure the entrypoint script has execution permissions
# # RUN chmod +x /entrypoint.sh

# # Switch back to the original user
# USER node

# # Set the entrypoint
# # ENTRYPOINT ["/entrypoint.sh"]

# # FROM directus/directus:10.10.5
# # USER root
# # RUN corepack enable \
# #   && corepack prepare pnpm@8.1.1 --activate \
# #   # Currently required, we'll probably address this in the base image in future release
# #   && chown -R node:node /directus /directus/database /directus/extensions /directus/uploads


# # # USER node
# # # RUN pnpm install directus-extension-group-modal-interface directus-extension-api-trigger-interface directus-extension-board-layout directus-extension-computed-interface directus-extension-grid-layout directus-extension-inline-form-interface

# # # Try out another time:
# # # directus-extension-seo // not working as of now. Wait for update > 1.3.2
# # # directus-extension-flow2pdf // not needed for now

# # FROM directus/directus:10.10.7
# # USER root
# # RUN apt-get update && apt-get install -y tzdata
# # ENV TZ=Europe/Zurich
# # RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

