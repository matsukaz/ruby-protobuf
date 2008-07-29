require 'test/unit'
require 'test/addressbook'

class SerializeTest < Test::Unit::TestCase
  def test_serialize
    person = Tutorial::Person.new
    person.id = 1234
    person.name = 'John Doe'
    person.email = 'jdoe@example.com'
    phone = Tutorial::Person::PhoneNumber.new
    phone.number = '555-4321'
    phone.type = Tutorial::Person::PhoneType::HOME
    person.phone << phone
    #File.open('test/data/data2.bin', 'w') do |f|
    #  person.serialize_to f
    #end
    string = ''
    person.serialize_to_string

    person2 = Tutorial::Person.new
    #person2.parse_from_file 'test/data/data2.bin'
    person2.parse_from_string string
    assert_equal 1234, person2.id
    assert_equal 'John Doe', person2.name
    assert_equal 'jdoe@example.com', person2.email
    assert_equal 1, person2.phone.size
    assert_equal '555-4321', person2.phone[0].number
    assert_equal Tutorial::Person::PhoneType::HOME, person2.phone[0].type
  end
end