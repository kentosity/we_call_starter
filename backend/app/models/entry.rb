class Entry < ApplicationRecord
    def notify_user_of_change(json_data)
        fullname = "#{json_data.surname} #{json_data.name}"
        entry_attributes = json_data.attributes.slice('id', 'surname', 'name', 'surnameKana', 'nameKana', 'gender', 'birthday', 'prefecture', 'address', 'email')
        entry_string = entry_attributes.map { |key, value| "#{key}: #{value}" }.join("\n")
        message = {
            type: 'text',
            text: "#{fullname}様に新しいお知らせです。\nお問い合わせを受け付けました!\n\n#{entry_string}"
        }

        line_client = get_line_bot_client
        response = line_client.push_message(@line_recepient_id, message)
    end
end
