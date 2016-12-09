module Lita
  module Extensions
    class ReactionDispatcher
      @@callbacks = {}

      def self.register(reply_result, callback)
        @@callbacks[key(reply_result)] = callback
      end

      def self.dispatch(payload)
        k = key(payload[:item])
        callback = @@callbacks[k]
        if callback
          callback.call(payload[:name])
          @@callbacks.delete(k)
        end
      end

      def self.key(reply_result)
        reply_result["ts"]
      end
    end
  end
end

