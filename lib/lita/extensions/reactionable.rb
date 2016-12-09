module Lita
  module Extensions
    class Reactionable
      def self.call(payload)
        reactionable = payload[:route].extensions[:reactionable]
        if reactionable
          response = payload[:response]
          install_reactionable_methods(response)
        end
      end

      def self.install_reactionable_methods(response)
        response.extend(ReactionableResponse)
      end

      module ReactionableResponse
        def reactionable_reply(msg, &block)
          ret = reply(msg)
          ReactionDispatcher.register(ret["ts"], block)
          ret
        end
      end
    end

    Lita.register_hook(:trigger_route, Reactionable)
  end
end
