module RequestStore
  module Sidekiq
    class ClientMiddleware
      def call(_worker_class, item, _queue, _redis_pool = nil)
        if ::RequestStore::Sidekiq.configuration.restore
          item['request_store'] = ::RequestStore.store
        end

        yield
      end
    end
  end
end
