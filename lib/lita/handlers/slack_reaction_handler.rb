module Lita
  module Handlers
    class SlackReactionHandler < Handler
      # insert handler code here

      on :slack_reaction_added, :handle_reaction

      def handle_reaction(payload)
      end

      Lita.register_handler(self)
    end
  end
end
