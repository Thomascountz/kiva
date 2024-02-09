require "discordrb"
require "dotenv/load"

require_relative "lib/slash_commands/ruok"

Discordrb::Bot.new(token: ENV.fetch("DISCORD_TOKEN", nil)).tap do |bot|
  # Events
  bot.include! Ruok

  at_exit { bot.stop }
end.run
