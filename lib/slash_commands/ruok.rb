module Ruok
  extend Discordrb::EventContainer

  application_command(:ruok) do |event|
    event.respond(content: "imok")
  end
end
