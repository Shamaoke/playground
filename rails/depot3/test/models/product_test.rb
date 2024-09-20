require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test 'product title must not be empty'  do
    product = Product.new(title: nil)

    product.save

    assert product.errors.details[:title].any?({ error: :blank })
  end

  test 'product with title \'22|22\' must be invalid' do
    product = Product.new(title: '22|22')

    product.save

    assert product.errors.details[:title].any? { |e| e.fetch(:error).eql? :invalid }
  end

  test 'product with title \'22/22\' must be valid' do
    product = Product.new(title: '22/22')

    product.save

    assert_not product.errors.details[:title].any? { |e| e.fetch(:error).eql? :invalid }
  end

  test 'product title must be unique' do
    product_first = Product.new(title: 'title')

    product_first.save(validate: false)

    product_second = Product.new(title: 'title')

    product_second.save

    assert product_second.errors.details[:title].any? { |e| e.fetch(:error).eql? :taken }
  end

end
