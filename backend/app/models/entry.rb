class Entry < ApplicationRecord
    def self.notify_user_of_change(json_data, line_client)
        fullname = "#{json_data.surname} #{json_data.name}"
        entry_attributes = json_data.attributes.slice('id', 'surname', 'name', 'surnameKana', 'nameKana', 'gender', 'birthday', 'prefecture', 'address', 'email')
        entry_string = format_entry_attributes(entry_attributes)
        message = construct_message(fullname, entry_string)

        response = send_notification(line_client, message)
    end


    private

    def self.format_entry_attributes(attribute)
        attribute.map { |key, value| "#{key}: #{value}" }.join("\n")
    end

    def self.construct_message(fullname, entry_string)
        {
            type: 'text',
            text: "#{fullname}様に新しいお知らせです。\nお問い合わせを受け付けました!\n\n#{entry_string}"
        }
    end

    def self.send_notification(client, message)
        client.push_message(@line_recepient_id, message)
    rescue StandardError => e
        Rails.logger.error("Error while sending Line notification: #{e.message}")
    end
end
