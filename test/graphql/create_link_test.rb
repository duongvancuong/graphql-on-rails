class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new Link' do
    link = perform(
      url: 'http://test.com',
      description: "description",
    )
    assert link.persisted?
    assert_equal link.description, 'description'
    assert_equal link.url, 'http://test.com'
  end
end
