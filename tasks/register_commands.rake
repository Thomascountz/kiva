require "discordrb"
require "dotenv/tasks"

namespace :discord do
  desc "Register guild application commands"
  task register_guild_commands: :dotenv do
    Dotenv.require_keys("DISCORD_TOKEN", "DISCORD_GUILD_ID")

    token = ENV.fetch("DISCORD_TOKEN", nil)
    server_id = ENV.fetch("DISCORD_GUILD_ID", nil)

    Discordrb::Bot.new(token:).yield_self do |bot|
      bot.register_application_command(:ruok, "Check to see if KiVA is doing okay.", server_id:)
    end
  end
end
