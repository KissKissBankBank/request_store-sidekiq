module RequestStore
  module Sidekiq
    class ServerMiddleware
      def call(_worker, job, _queue)
        if job['request_store'].present?
          ::RequestStore.store.merge!(job['request_store'])
        end
        yield
      ensure
        ::RequestStore.clear!
      end
    end
  end
end
