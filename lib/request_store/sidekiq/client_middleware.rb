module RequestStore
  module Sidekiq
    class ClientMiddleware
      def call(_worker_class, item, _queue, _redis_pool = nil)
        item['request_store'] = ::RequestStore.store
        yield
      end
    end
  end
end
