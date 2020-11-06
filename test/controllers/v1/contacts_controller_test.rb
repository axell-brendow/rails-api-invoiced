require 'test_helper'

class V1::ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test 'index' do
    get v1_contacts_url
    assert_response :ok
  end

  test 'create' do
    assert_difference('Contact.count') do
      post v1_contacts_url, params: {
        contact: {
          first_name: @contact.first_name,
          last_name: @contact.last_name,
          email: @contact.email
        }
      }
    end
  end

  test 'destroy' do
    assert_difference('Contact.count', -1) do
      delete v1_contact_url(@contact)
    end
  end
end
