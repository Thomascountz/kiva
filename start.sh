#!/bin/sh

# Register commands
bundle exec rake discord:register_guild_commands

# Start the bot
exec ruby bot.rb
