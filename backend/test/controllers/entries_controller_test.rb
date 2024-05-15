require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url, as: :json
    assert_response :success
  end

  test "should create entry" do
    assert_difference("Entry.count") do
      post entries_url, params: { entry: { address: @entry.address, birthday: @entry.birthday, email: @entry.email, gender: @entry.gender, name: @entry.name, nameKana: @entry.nameKana, prefecture: @entry.prefecture, surname: @entry.surname, surnameKana: @entry.surnameKana } }, as: :json
    end

    assert_response :created
  end

  test "should show entry" do
    get entry_url(@entry), as: :json
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { address: @entry.address, birthday: @entry.birthday, email: @entry.email, gender: @entry.gender, name: @entry.name, nameKana: @entry.nameKana, prefecture: @entry.prefecture, surname: @entry.surname, surnameKana: @entry.surnameKana } }, as: :json
    assert_response :success
  end

  test "should destroy entry" do
    assert_difference("Entry.count", -1) do
      delete entry_url(@entry), as: :json
    end

    assert_response :no_content
  end
end
