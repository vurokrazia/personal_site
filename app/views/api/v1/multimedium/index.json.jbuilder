# frozen_string_literal: true

json.array! @multimedia, partial: 'api/v1/multimedium/multimedium', as: :multimedium
