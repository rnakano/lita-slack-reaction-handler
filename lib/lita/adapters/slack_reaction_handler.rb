module Lita
  module Adapters
    class SlackReactionHandler < Adapter
      # insert adapter code here

      Lita.register_adapter(:slack_reaction_handler, self)
    end
  end
end
